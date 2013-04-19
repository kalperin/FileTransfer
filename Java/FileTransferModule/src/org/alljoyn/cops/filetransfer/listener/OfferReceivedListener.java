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
 * The OfferReceivedListener can be used by developers to determine the default
 * action taken when a file offer is received from a session peer. The default
 * behavior is to deny all file offers. The acceptOfferedFile() method should be
 * implemented to return to true if you wish to accept files offered by remote
 * session peers.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#setOfferReceivedListener}
 */
public interface OfferReceivedListener
{
	/**
	 * acceptOfferedFile()
	 * is triggered when a file offer is received. Return true if the offer
	 * is to be accepted, or false to reject it. If the listener is not
	 * implemented, the offer will be rejected by default.
	 * 
	 * @param file  the file descriptor for the file being offered
	 * @param peer  the peer offering the file
	 * @return return true to accept, false to reject
	 */
	public boolean acceptOfferedFile(FileDescriptor file, String peer);
}
