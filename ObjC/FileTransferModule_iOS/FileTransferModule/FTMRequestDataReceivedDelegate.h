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
 * The FTMRequestDataReceivedDelegate is an optional delegate that the developer can set
 * so it can be notified when a file has been requested by a session peer. This delegate 
 * is not mandatory and will not impede file transfer functionality if not set.
 *
 * See [FTMFileTransferModule setRequestDataReceivedDelegate:].
 */
@protocol FTMRequestDataReceivedDelegate <NSObject>

/** @name Required Methods */

@required

/**
 * Triggered to notify the user when a file request is received.
 *
 * @param fileName Specifies the name of the file being requested.
 */
-(void) fileRequestReceived: (NSString *) fileName;

@end
