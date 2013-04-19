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

#import "AllJoynManager.h"

//Specifies the AllJoyn service name and port number.
NSString *SERVICE_NAME = @"org.alljoyn.cops.filetransfer";
const AJNSessionPort CONTACT_PORT = 42;

@interface AllJoynManager()

@property (nonatomic) ConnectionState connectionState;

@end

@implementation AllJoynManager

@synthesize bus = _bus;
@synthesize sessionID = _sessionID;
@synthesize connectionState = _connectionState;
@synthesize peers = _peers;

/*
 * Initializes the AllJoynManager class.
 */
-(id)init
{
	self = [super init];
	
	if (self)
    {
        self.connectionState = DISCONNECTED;
        self.peers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/*
 * Creates an AllJoyn session where we are the host.
 */
-(void)createSession
{
    if (self.connectionState == JOINING)
    {
        [self.bus disconnectWithArguments:@"null:"];        
    }
    
    [self updateConnectionState: HOSTING];
    
    self.bus = [[AJNBusAttachment alloc] initWithApplicationName:@"FileTransfer" allowRemoteMessages: YES];
    int status = [self.bus start];
    status = [self.bus connectWithArguments: @"null:"];
    
    AJNSessionOptions *sessionOptions = [[AJNSessionOptions alloc] initWithTrafficType: kAJNTrafficMessages supportsMultipoint: YES proximity: kAJNProximityAny transportMask: kAJNTransportMaskAny];
    
    status = [self.bus requestWellKnownName: SERVICE_NAME withFlags: kAJNBusNameFlagReplaceExisting| kAJNBusNameFlagDoNotQueue];
    status = [self.bus bindSessionOnPort: CONTACT_PORT withOptions: sessionOptions withDelegate:self];
    status = [self.bus advertiseName: SERVICE_NAME withTransportMask: sessionOptions.transports];
}

/*
 * Attempts to join an already exisiting AllJoyn session.
 */
-(void)joinSession
{
    if (self.connectionState == HOSTING)
    {
        [self.bus disconnectWithArguments:@"null:"];
    }
    
    [self updateConnectionState: JOINING];
    
    self.bus = [[AJNBusAttachment alloc] initWithApplicationName: @"FileTransfer" allowRemoteMessages: YES];
    
    int status = [self.bus start];
    
    status = [self.bus connectWithArguments: @"null:"];
    
    [self.bus registerBusListener: self];
    
    [self.bus findAdvertisedName: SERVICE_NAME];
}

/*
 * Handles the event that is triggered when an exisiting AllJoyn session is found.
 */
-(void)didFindAdvertisedName: (NSString *)name withTransportMask: (AJNTransportMask) transport namePrefix:(NSString *)namePrefix
{
    AJNSessionOptions *sessionOptions = [[AJNSessionOptions alloc] initWithTrafficType: kAJNTrafficMessages supportsMultipoint: YES proximity: kAJNProximityAny transportMask: kAJNTransportMaskAny];
    
    self.sessionID = [self.bus joinSessionWithName: name onPort: CONTACT_PORT withDelegate:self options: sessionOptions];
    NSLog(@"joined session %i", self.sessionID);
    
    [self updateConnectionState: CONNECTED];
}

/*
 * Handles the even that is triggered when someone attempts to joing our session. This function just
 * returns yes which means the session is open to anyone attempting to join.
 */
-(BOOL)shouldAcceptSessionJoinerNamed: (NSString *)joiner onSessionPort: (AJNSessionPort)sessionPort withSessionOptions: (AJNSessionOptions *)options
{
    return YES;
}

/*
 * Handles the event that is triggered when someone joins our AllJoyn session successfully. This function adds
 * the peer to a list and notifies the ViewController class that the AllJoyn session is now connected.
 */
-(void)didJoin: (NSString *)joiner inSessionWithId: (AJNSessionId)sessionId onSessionPort: (AJNSessionPort)sessionPort
{
    self.sessionID = sessionId;
    NSLog(@"hosted session %i", self.sessionID);
    
    [self updateConnectionState: CONNECTED];
    
    [self.peers addObject: joiner];
}

/*
 * Disconnects from the current AllJoyn session and notifies the ViewController class that the we have left
 * the current AllJoyn session.
 */
-(void)disconnect
{
    if (self.connectionState == CONNECTED)
    {
        [self.bus leaveSession: self.sessionID];
        [self.bus disconnectWithArguments: @"null:"];
        
        [self updateConnectionState:DISCONNECTED];
    }
}

/*
 * Notifies the ViewController class via the connectionStateChangedDelegate that a connection state changed
 * event has occured.
 */
-(void)updateConnectionState: (ConnectionState)state
{
    self.connectionState = state;
    if (self.connectionStateChangedDelegate != nil)
    {
        [self.connectionStateChangedDelegate connectionStateChanged: state];
    }
}

/*
 * Handles the event that is triggered when a peer is added to our session. The peer name is added to an internal
 * list so we know who is in our session.
 */
-(void)didAddMemberNamed:(NSString *)memberName toSession:(AJNSessionId)sessionId
{
    [self.peers addObject: memberName];
}

/*
 * Handles the even that is triggered when the AllJoyn session we are in is lost. 
 */
-(void)sessionWasLost:(AJNSessionId)sessionId
{
    [self disconnect];
}

@end
