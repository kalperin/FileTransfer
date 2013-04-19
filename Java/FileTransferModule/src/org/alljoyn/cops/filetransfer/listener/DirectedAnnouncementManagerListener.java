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

import org.alljoyn.cops.filetransfer.data.Action;
import org.alljoyn.cops.filetransfer.data.FileDescriptor;

/**
 * The DirectedAnnouncementListener is an internal listener that is used by the
 * File Transfer Bus Object, Dispatcher, and Receiver to notify the Directed
 * AnnouncementManager that various events have occurred. Such events include
 * handling offer requests and responses and generating file descriptor when
 * sending offer responses. 
 * <p>
 * Note: This class is not intended to be used directly. All of the supported
 * functionality of this library is intended to be accessed through the
 * {@link org.alljoyn.cops.filetransfer.FileTransferModule} class.
 */
public interface DirectedAnnouncementManagerListener 
{
	/**
	 * handleOfferRequest()
	 * is triggered by the bus object to notify the Directed Announcement Manager
	 * when a request for an unannounced file has been received. 
	 * 
	 * @param filePath  specifies the absolute path of the file being requested
	 * @param peer  specifies the peer requesting an unannounced file
	 * @return OK or REQUEST_DENIED
	 */
	public int handleOfferRequest(String filePath, String peer);
	
	/**
	 * generateFileDescriptor()
	 * is triggered by the dispatcher to begin generating the file
	 * descriptor for a file requested using requestOffer(). 
	 * 
	 * @param action  contains the parameters required for the descriptor
	 */
	public void generateFileDescriptor(Action action);
	
	/**
	 * handleOfferResponse()
	 * is triggered by the Receiver when an announcement signal is received that
	 * is in response to an offer request.
	 * 
	 * @param fileList  specifies the list of announced files 
	 * @param peer  specifies the peer that sent the directed announcement
	 */
	public void handleOfferResponse(FileDescriptor[] fileList, String peer);
}
