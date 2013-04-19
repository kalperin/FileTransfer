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

import java.util.ArrayList;

/**
 * The FileAnnouncementSentListener can be utilized so the developer is notified
 * when the announce function has finished and sent an announcement to session 
 * peers. Since the announce function is executed on a separate thread (to avoid
 * hanging the application thread due to time intensive hashing of the files), the
 * user can implement this listener to be notified when the announce function has
 * finished executing. This listener returns an array containing the paths
 * of the files that failed to be announced. This listener is entirely optional and
 * will not impede normal file announcement functionality.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#setFileAnnouncementSentListener}
 */
public interface FileAnnouncementSentListener 
{
	/**
	 * announcementSent()
	 * is triggered when the announce function has finished executing. Notifies the user
	 * which file paths, if any, failed to be announced.
	 * 
	 * @param failedPaths  array of file paths that failed to be announced
	 */
	public void announcementSent(ArrayList<String> failedPaths);
}
