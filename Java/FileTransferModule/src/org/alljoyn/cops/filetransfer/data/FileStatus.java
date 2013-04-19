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
 * The File Status object is used by the File Transfer Manager and the File
 * Receive Manager to monitor the progress of files that are being sent and
 * received. From the senders perspective, the file status will show the file
 * ID of the file being transferred, the length of the file, the peer to send
 * the file to, how many bytes have already been sent, and the maximum chunk
 * length specified by the receiver. From the receivers perspective, all of 
 * same data is monitored by the receiver with a few additions. The receiver
 * also keeps track of the save file name and the save file path. This is 
 * essential so the file chunks can be appended to the correct file.  
 * <p>
 * Note: This class is not intended to be used directly. All of the supported
 * functionality of this library is intended to be accessed through the
 * {@link org.alljoyn.cops.filetransfer.FileTransferModule} class.
 */
public class FileStatus 
{
	// Member Variables
	public byte[] fileId;	
	public int startByte;	
	public int length;	
	public String peer;	
	public int numBytesSent;	
	public String saveFileName;
	public String saveFilePath;	
	public int chunkLength;
	
	/*------------------------------------------------------------------------*
     * Constructor
     *------------------------------------------------------------------------*/
	/**
	 * FileStatus()
	 * creates an instance of the FileStatus class.
	 */
	public FileStatus()
	{
		//Intentionally left blank
	}
}
