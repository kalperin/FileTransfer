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
 * The FTMAnnouncementManagerDelegate is an internal delegate that is used by the
 * FTMReceiver to notify the FTMAnnouncementManager that various events have occurred.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@protocol FTMAnnouncementManagerDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered by the FTMReceiver when a normal announcement is received from a remote session peer.
 *
 * @param fileList Specifies the list of announced files.
 * @param peer Specifies the peer who sent the announcement.
 */
-(void)handleAnnouncedFiles: (NSArray *)fileList fromPeer: (NSString *)peer;

/**
 * Triggered by the FTMReceiver when an announcement request is received from a remote session peer.
 *
 * @param peer Specifies the peer that made the announcement request.
 */
-(void)handleAnnouncementRequestFrom: (NSString *)peer;

@end
