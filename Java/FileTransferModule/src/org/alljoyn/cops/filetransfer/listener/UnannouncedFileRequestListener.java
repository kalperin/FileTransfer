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
 * The UnannouncedFileRequestListener is required if the developer wishes
 * to allow session peers to request files that have not been explicitly
 * announced or shared. The default behavior is to deny all requests for
 * files that have not been announced or shared.
 * <p>
 * See {@link org.alljoyn.cops.filetransfer.FileTransferModule#setUnannouncedFileRequestListener}
 */
public interface UnannouncedFileRequestListener 
{
	/**
	 * allowUnannouncedFileRequests()
	 * is required for use of the requestOffer() method. When a file request is received
	 * for an unannounced file, this listener is triggered. Return true to allow the request, 
	 * false to deny the request.
	 * 
	 * @param filePath  path of file being requested
	 * @return  true to accept the request, false to reject the request
	 */
	public boolean allowUnannouncedFileRequests(String filePath);
}
