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

package org.alljoyn.cops.filetransfer.listener;

/**
 * The SendManager Listener is an internal listener that is used by the OfferManager,
 * the bus object, and the Receiver to notify the SendManager that various events 
 * have occurred.  
 * <p>
 * Note: This class is not intended to be used directly. All of the supported
 * functionality of this library is intended to be accessed through the
 * {@link org.alljoyn.cops.filetransfer.FileTransferModule} class.
 */
public interface SendManagerListener 
{
	/**
	 * sendFile()
	 * is triggered by the bus object or the Offer Manager to notify the Send
	 * Manager to begin sending the file matching the specified file ID.
	 * 
	 * @param fileID  specifies the fileId of the file the data belongs to
	 * @param startByte  specifies the starting byte of the chunk relative to the file
	 * @param length  specifies the length of data chunk
	 * @param peer  specifies the peer to send the file to
	 * @param maxChunkLength  specifies the maximum chunk size
	 * @return OK or BAD_FILE_ID
	 */
	public int sendFile(byte[] fileID, int startByte, int length, String peer, int maxChunkLength);
	
	/**
	 * dataSent()
	 * is triggered by the dispatcher when a data chunk action has been 
	 * sent to the transmitter and to notify the Send Manager to queue the
	 * next data chunk if available.
	 */
	public void dataSent();
	
	/**
	 * handleStopDataXfer()
	 * is triggered by the Receiver when a stopDataXfer signal is received from the
	 * file receiver. This callback notifies the Send Manager to stop sending the file
	 * matching the specified file ID.
	 * 
	 * @param fileID  specifies the ID of the file
	 * @param peer  specifies the peer receiving the file
	 */
	public void handleStopDataXfer(byte[] fileID, String peer);
}
