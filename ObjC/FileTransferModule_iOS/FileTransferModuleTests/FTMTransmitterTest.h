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

#import <SenTestingKit/SenTestingKit.h>
#import "AllJoynFrameWork/AJNBusAttachment.h"
#import "FTMFileTransferBusObject.h"
#import "FTMConstants.h"
#import "FTMTransmitter.h"
#import "AllJoynFrameWork/AJNSessionPortListener.h"
#import "AllJoynFrameWork/AJNInterfaceDescription.h"
#import "FTMFileDescriptor.h"

@interface FTMTransmitterTest : SenTestCase <AJNSessionPortListener, AJNSessionListener, AJNBusListener, FTMDirectedAnnouncementManagerDelegate, FTMSendManagerDelegate, FTMOfferManagerDelegate, DataTransferDelegateSignalHandler, FileDiscoveryDelegateSignalHandler>

-(void)setUp;
-(void)tearDown;
-(void)testRequestAnnouncement;
-(void)testStopDataXfer;
-(void)testDataChunk;
-(void)testDataXferCancelled;
-(void)testAnnouncement;
-(void)testRequestOffer;
-(void)testRequestData;
-(void)testOffer;

// From FileTransferBusObjectDelegateSignalHandler
-(void)didReceiveDataChunkWithFileID:(AJNMessageArgument*)fileID startByte:(NSNumber*)startByte length:(NSNumber*)chunkLength andFileChunk:(AJNMessageArgument*)chunk inSession:(AJNSessionId)sessionId fromSender:(NSString *)sender;
-(void)didReceiveStopDataXferWithFileID:(AJNMessageArgument*)fileID inSession:(AJNSessionId)sessionId fromSender:(NSString *)sender;
-(void)didReceiveDataXferCancelledWithFileID:(AJNMessageArgument*)fileID inSession:(AJNSessionId)sessionId fromSender:(NSString *)sender;
-(void)didReceiveAnnounceWithFileList:(AJNMessageArgument*)fileList andIsFileIDResponse:(BOOL)isFileIDResponse inSession:(AJNSessionId)sessionId fromSender:(NSString *)sender;
-(void)didReceiverequestAnnouncementInSession:(AJNSessionId)sessionId fromSender:(NSString *)sender;

@end
