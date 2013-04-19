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
#import "AllJoynFramework/AJNBusAttachment.h"
#import "AllJoynFramework/AJNStatus.h"
#import "ConnectionSateChangedDelegate.h"

/*
 * This class handles everything associated with AllJoyn by creating sessions, joining exisiting sessions,
 * leaving sessions, and keeping tracked of peers that join the session. This class is also responsible for
 * notifying the ViewController class of any connection state change events that occur so they can be shown
 * to the user.
 */
@interface AllJoynManager : NSObject <AJNSessionPortListener, AJNSessionListener, AJNBusListener>

@property (nonatomic, strong) id<ConnectionSateChangedDelegate>connectionStateChangedDelegate;
@property (nonatomic, strong) NSMutableArray *peers;
@property (nonatomic, strong) AJNBusAttachment *bus;
@property (nonatomic) AJNSessionId sessionID;

-(id)init;
-(void)createSession;
-(void)joinSession;
-(void)disconnect;
-(void)didAddMemberNamed:(NSString *)memberName toSession:(AJNSessionId)sessionId;
-(void)sessionWasLost:(AJNSessionId)sessionId;

@end
