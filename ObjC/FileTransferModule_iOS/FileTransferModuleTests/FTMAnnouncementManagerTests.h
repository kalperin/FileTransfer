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
#import "FTMAnnouncementManager.h"
#import "FTMMockDispatcher.h"
#import "FTMMockFileSystemAbstraction.h"
#import "FTMMockPermissionsManager.h"
#import "FTMMockTransmitter.h"
#import "TestProtocol.h"
#import "FTMFileAnnouncementReceivedDelegate.h"
#import "FTMFileAnnouncementSentDelegate.h"

@interface FTMAnnouncementManagerTests : SenTestCase <TestProtocol, FTMFileAnnouncementReceivedDelegate, FTMFileAnnouncementSentDelegate>

- (void)setUp;
- (void)tearDown;

//FTCAnnouncementManager test functions
-(void)testAnnounce;
-(void)testStopAnnounce;
-(void)testRequestAnnouncement;
-(void)testHandleAnnouncedFiles;
-(void)testHandleAnnouncementRequest;
-(void)testSetFileAnnouncementReceivedDelegate;
-(void)testSetFileAnnouncementSentDelegate;
-(void)testShowSharedPath;
-(void)testShowRelativePath;

//Test Protocol Functions
-(void)dataChunkSent: (FTMDataChunkAction *)dataChunkAction;
-(void)fileIDRequestSent: (FTMFileIDResponseAction *)fileIDResponseAction;
-(void)sendAnnouncementWithFileList: (NSArray *)fileList toPeer: (NSString *)peer andIsFileIDResponse: (BOOL)isFileIDResponse;
-(void)sendRequestDataUsingFileID: (NSData *)fileID startByte: (int)startByte length: (int)length andMaxChunkSize: (int)maxChunkSize toPeer: (NSString *)peer;
-(void)sendDataChunkUsingFileID: (NSData *)fileID startByte: (int)startByte chunkLength: (int)chunkLength andFileData: (NSData *)chunk toPeer: (NSString *)peer;
-(void)sendOfferFileWithFileDescriptor: (FTMFileDescriptor *)fd toPeer: (NSString *)peer;
-(void)sendAnnouncementRequestToPeer: (NSString *)peer;
-(void)sendStopDataXferForFileID: (NSData *)fileID toPeer: (NSString *)peer;
-(void)sendXferCancelledForFileID: (NSData *)fileID toPeer: (NSString *)peer;
-(void)sendRequestOfferForFileWithPath: (NSString *)filePath toPeer: (NSString *)peer;

//FTCFileAnnouncementReceivedDelegate
-(void)receivedAnnouncementForFiles: (NSArray *)fileList andIsFileIDResponse: (BOOL)isFileIDResponse;

//FTCFileAnnouncementSentDelegate
-(void)announcementSentWithFailedPaths: (NSArray *)failedPaths;

@end