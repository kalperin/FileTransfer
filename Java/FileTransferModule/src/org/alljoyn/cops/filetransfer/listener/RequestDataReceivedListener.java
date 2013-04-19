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
 * The RequestDataListener is an optional listener that the developer can implement
 * so it can be notified when a file has been requested by a session peer. This
 * listener is not mandatory and will not impede file transfer functionality if not
 * implemented.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#setRequestDataReceivedListener}
 */
public interface RequestDataReceivedListener 
{
	/**
	 * fileRequestReceived()
	 * is triggered to notify the user when a file request is received.
	 * 
	 * @param fileName  specifies the name of the file being requested
	 */
	public void fileRequestReceived(String fileName);
}
