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

#import "FTMMockTransmitter.h"

@implementation FTMMockTransmitter

@synthesize delegate = _delegate;
@synthesize statusCodeToReturn = _statusCodeToReturn;

-(FTMStatusCode)sendAnnouncementWithFileList: (NSArray *)fileList toPeer: (NSString *)peer andIsFileIDResponse: (BOOL)isFileIDResponse
{
    [self.delegate sendAnnouncementWithFileList: fileList toPeer: peer andIsFileIDResponse: isFileIDResponse];
    return FTMOK;
}

-(FTMStatusCode)sendRequestDataUsingFileID: (NSData *)fileID startByte: (int)startByte length: (int)length andMaxChunkSize: (int)maxChunkSize toPeer: (NSString *)peer
{
    [self.delegate sendRequestDataUsingFileID: fileID startByte: startByte length: length andMaxChunkSize: maxChunkSize toPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendDataChunkUsingFileID: (NSData *)fileID startByte: (int)startByte chunkLength: (int)chunkLength andFileData: (NSData *)chunk toPeer: (NSString *)peer
{
    [self.delegate sendDataChunkUsingFileID: fileID startByte: startByte chunkLength: chunkLength andFileData: chunk toPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendOfferFileWithFileDescriptor: (FTMFileDescriptor *)fd toPeer: (NSString *)peer
{
    [self.delegate sendOfferFileWithFileDescriptor: fd toPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendAnnouncementRequestToPeer: (NSString *)peer
{
    [self.delegate sendAnnouncementRequestToPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendStopDataXferForFileID: (NSData *)fileID toPeer: (NSString *)peer
{
    [self.delegate sendStopDataXferForFileID: fileID toPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendXferCancelledForFileID: (NSData *)fileID toPeer: (NSString *)peer
{
    [self.delegate sendXferCancelledForFileID: fileID toPeer: peer];
    return FTMOK;
}

-(FTMStatusCode)sendRequestOfferForFileWithPath: (NSString *)filePath toPeer: (NSString *)peer
{
    [self.delegate sendRequestOfferForFileWithPath: filePath toPeer: peer];
    return self.statusCodeToReturn;
}

@end
