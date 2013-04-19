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

import org.alljoyn.cops.filetransfer.data.FileDescriptor;

/**
 * The AnnouncementManagerListener is an internal listener that is used by the
 * Receiver to notify the AnnouncementManager that various events have occurred.
 * <p>
 * Note: This class is not intended to be used directly. All of the supported
 * functionality of this library is intended to be accessed through the
 * {@link org.alljoyn.cops.filetransfer.FileTransferModule} class.
 */
public interface AnnouncementManagerListener 
{
	/**
	 * handleAnnounced()
	 * is triggered by the Receiver when a normal announcement is received from
	 * a remote session peer.
	 * 
	 * @param fileList  specifies the list of announced files
	 * @param peer  specifies the peer who sent the announcement
	 */
	public void handleAnnounced(FileDescriptor[] fileList, String peer);
	
	/**
	 * handleAnnouncementRequest()
	 * is triggered by the Receiver when an announcement request is received from
	 * a remote session peer.
	 * 
	 * @param peer  specifies the peer that made the announcement request
	 */
	public void handleAnnouncementRequest(String peer);
}
