/******************************************************************************
 * Copyright 2013, Qualcomm Innovation Center, Inc.
 *
 *    All rights reserved.
 *    This file is licensed under the 3-clause BSD license in the NOTICE.txt
 *    file for this project. A copy of the 3-clause BSD license is found at:
 *
 *        http://opensource.org/licenses/BSD-3-Clause.
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the license is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the license for the specific language governing permissions and
 *    limitations under the license.
 ******************************************************************************/

package org.alljoyn.cops.filetransfer.test;

import java.util.ArrayList;
import org.alljoyn.cops.filetransfer.Dispatcher;
import org.alljoyn.cops.filetransfer.FileSystemAbstraction;
import org.alljoyn.cops.filetransfer.SendManager;
import org.alljoyn.cops.filetransfer.PermissionsManager;
import org.alljoyn.cops.filetransfer.Transmitter;
import org.alljoyn.cops.filetransfer.data.Action;
import org.alljoyn.cops.filetransfer.data.FileDescriptor;
import org.alljoyn.cops.filetransfer.data.ProgressDescriptor;
import org.alljoyn.cops.filetransfer.data.StatusCode;

import android.test.AndroidTestCase;

public class SendManagerTest extends AndroidTestCase
{	
	private SendManager sendManager;
	private MockFileSystemAbstraction mockFSA;
	private MockDispatcher mockDispatcher;
	private MockTransmitter mockTransmitter;
	private MockPermissionsManager mockPermissionsManager;
	
	protected void setUp() throws Exception
	{		
		mockFSA = new MockFileSystemAbstraction();
		mockPermissionsManager = new MockPermissionsManager();
		mockTransmitter = new MockTransmitter();
		mockDispatcher = new MockDispatcher(mockTransmitter);
		
		FileDescriptor file = getDummyFileDescriptor();	
		mockPermissionsManager.addAnnouncedLocalFiles(new FileDescriptor[] { file });
		
		sendManager = new SendManager(mockDispatcher, mockFSA, mockPermissionsManager);
		mockDispatcher.setSendManagerListener(sendManager);		
	}
	
	public void testHandleRequestFile()
	{
		FileDescriptor descriptor = getDummyFileDescriptor();
		
		int status = sendManager.handleFileRequest(descriptor.fileID, 0, 100, descriptor.owner, 100);
		assertEquals(StatusCode.OK, status);
		
		status = sendManager.handleFileRequest(new byte[20], 0, 100, descriptor.owner, 100);
		assertEquals(StatusCode.BAD_FILE_ID, status);		
	}
	
	public void testDataSent()
	{
		FileDescriptor descriptor = getDummyFileDescriptor();
		
		int status = sendManager.handleFileRequest(descriptor.fileID, 0, 101, descriptor.owner, 50);
		assertEquals(StatusCode.OK, status);
		
		ProgressDescriptor progress = sendManager.getProgressList().get(0);
		assertEquals(50, progress.bytesTransferred);
		
		sendManager.dataSent();
		
		progress = sendManager.getProgressList().get(0);
		assertEquals(100, progress.bytesTransferred);
		
		sendManager.dataSent();
		
		ArrayList<ProgressDescriptor> progressList = sendManager.getProgressList();
		assertEquals(0, progressList.size());
	}
	
	public void testGetProgressList()
	{
		//test progress list starts empty
		ArrayList<ProgressDescriptor> progressList = sendManager.getProgressList();
		assertEquals(0, progressList.size());
		
		//test progress list updates as expected
		FileDescriptor descriptor = getDummyFileDescriptor();
		
		int status = sendManager.handleFileRequest(descriptor.fileID, 0, 100, descriptor.owner, 50);
		assertEquals(StatusCode.OK, status);
		
		progressList = sendManager.getProgressList();
		assertEquals(1, progressList.size());
		assertEquals(50, progressList.get(0).bytesTransferred);
	}
	
	public void testCancelFile()
	{
		FileDescriptor file = getDummyFileDescriptor();
		
		int status = sendManager.handleFileRequest(file.fileID, 0, 100, file.owner, 50);
		assertEquals(StatusCode.OK, status);		
		
		status = sendManager.cancelFile(file.fileID);
		assertEquals(StatusCode.OK, status);
		
		ArrayList<ProgressDescriptor> progressList = sendManager.getProgressList();
		assertEquals(0, progressList.size());
		
		//ensure invalid cancel case handled
		status = sendManager.cancelFile(new byte[20]);
		assertEquals(StatusCode.FILE_NOT_BEING_TRANSFERRED, status);
	}
	
	public void testHandleStopDataXfer()
	{
		FileDescriptor file = getDummyFileDescriptor();
		
		int status = sendManager.handleFileRequest(file.fileID, 0, 100, file.owner, 50);
		assertEquals(StatusCode.OK, status);		
		
		sendManager.handleStopDataXfer(file.fileID, file.owner);
		
		ArrayList<ProgressDescriptor> progressList = sendManager.getProgressList();
		assertEquals(0, progressList.size());
		
		//ensure invalid cancel case handled
		status = sendManager.handleFileRequest(file.fileID, 0, 100, file.owner, 50);
		assertEquals(StatusCode.OK, status);
		
		sendManager.handleStopDataXfer(new byte[20], file.owner);
		progressList = sendManager.getProgressList();
		assertEquals(1, progressList.size());
	}
	
	private FileDescriptor getDummyFileDescriptor()
	{
		FileDescriptor descriptor = new FileDescriptor();
		descriptor.fileID = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
		descriptor.filename = "foo";
		descriptor.owner = "bar";
		descriptor.relativePath = "";
		descriptor.sharedPath = "";
		descriptor.size = 100;
		
		return descriptor;
	}
	
	private class MockFileSystemAbstraction extends FileSystemAbstraction
	{
		@Override
		public FileDescriptor[] getFileInfo(ArrayList<String> pathList,
				ArrayList<String> failedPaths, String localBusId)
		{
			return new FileDescriptor[] { getDummyFileDescriptor() };
		}	
	}

	private class MockDispatcher extends Dispatcher
	{
		public MockDispatcher(Transmitter transmitter)
		{
			super(transmitter);
		}			
	}

	private class MockTransmitter extends Transmitter
	{	
		private int result = StatusCode.INVALID;
		
		public MockTransmitter()
		{
			super(null, null, 0);
		}
		
		@Override
		public int transmit(Action action)
		{
			return result;			
		}
	}
	
	private class MockPermissionsManager extends PermissionsManager
	{
		
	}
}
