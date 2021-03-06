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
#import "AllJoynFramework/AJNBusObject.h"
#import "AllJoynFramework/AJNBusAttachment.h"
#import "FTMStatusCode.h"
#import "FTMAction.h"
#import "FTMSendManagerDelegate.h"
#import "FTMDirectedAnnouncementManagerDelegate.h"
#import "FileTransferBusObject.h"
#import "FTMTransmitter.h"
#import "FTMDispatcher.h"

@interface FTMMockDispatcher : FTMDispatcher

// used by unit tests
@property (nonatomic) FTMStatusCode statusCodeToReturn;
@property (nonatomic) NSString *callerIs;
@property (nonatomic) BOOL allowDispatching;

-(void)insertAction: (FTMAction *)action;

@end
