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

#import <Foundation/Foundation.h>

/**
 * The FTMUnannouncedFileRequestDelegate is required if the developer wishes
 * to allow session peers to request files that have not been explicitly
 * announced or shared. The default behavior is to deny all requests for
 * files that have not been announced or shared.
 * 
 * See [FTMFileTransferModule setUnannouncedFileRequestDelegate:].
 */
@protocol FTMUnannouncedFileRequestDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered when a request is received for an unannounced file. 
 *
 * @param filePath Specifies the absolute path of file being requested.
 *
 * @return True to allow the request, false to reject the request.
 */
-(BOOL)allowUnannouncedRequestsForFileWithPath: (NSString *) filePath;

@end
