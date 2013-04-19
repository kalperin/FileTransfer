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
 * The FTMFileAnnouncementSentDelegate can be utilized so the developer is notified
 * when the announce function has finished executing and sent an announcement to session
 * peers. Since the announce function is executed on a background thread (to avoid
 * hanging the application thread due to time intensive hashing operations), the
 * user can set this delegate so they will be notified when the announce function has
 * finished executing. This delegate returns an array containing the paths
 * of the files that failed to be announced. This delegate is entirely optional and
 * will not impede normal file announcement functionality.
 * 
 * See [FTMFileTransferModule setFileAnnouncementSentDelegate:].
 */
@protocol FTMFileAnnouncementSentDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered when the announce function has finished executing. 
 *
 * Notifies the user which file paths, if any, failed to be announced.
 *
 * @param failedPaths Array of file paths that failed to be announced.
 */
-(void)announcementSentWithFailedPaths: (NSArray *)failedPaths;

@end
