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

package org.alljoyn.cops.filetransfer.data;

/**
 * The Progress Descriptor is utilized when the user requests file transfer status
 * updates from either the sender or the receiver. This class will outline all of
 * the files that are being transferred by specifying how many bytes have already been
 * sent or received and give the total length of the file. This will allow the user to
 * see the current progress of each file transfer.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#getSendingProgressList}
 * and {@link org.alljoyn.cops.filetransfer.FileTransferModule#getReceiveProgressList}
 * <p>
 * Note: This class is not intended to be used directly. All of the supported
 * functionality of this library is intended to be accessed through the
 * {@link org.alljoyn.cops.filetransfer.FileTransferModule} class.
 */
public class ProgressDescriptor 
{
	// Class Enumerator
	public enum State 
	{ 
		IN_PROGRESS, 
		PAUSED, 
		TIMED_OUT 
	}
	
	// Member Variables
	public byte[] fileID;	
	public State state;	
	public int bytesTransferred;	
	public int fileSize;
	
	/*------------------------------------------------------------------------*
     * Constructor
     *------------------------------------------------------------------------*/
	/**
	 * ProgressDescriptor()
	 * creates an instance of the ProgressDescriptor class.
	 */
	public ProgressDescriptor()
	{
		//Intentionally left blank
	}
}
