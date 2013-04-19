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
 * The FileCompletedListener can be utilized so that the developer can be notified when
 * a file transfer has been completed. This event will be triggered by the 
 * ReceiveManager when a file transfer has completed or been cancelled.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#setFileCompletedListener}
 */
public interface FileCompletedListener
{
	/**
	 * fileCompleted()
	 * is triggered when a transmission has been completed. Will be
	 * triggered on cancellation as well as successful completion.
	 * 
	 * @param filename  the name of the file that completed transmission
	 * @param statusCode  OK if completely transfered, CANCELLED otherwise 
	 */
	public void fileCompleted(String filename, int statusCode);	
}