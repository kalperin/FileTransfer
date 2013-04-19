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

#import "FTMAction.h"

@implementation FTMAction

@synthesize peer = _peer;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return FTMOK;
}

@end

@implementation FTMAnnounceAction

@synthesize fileList = _fileList;
@synthesize isFileIDResponse = _isFileIDResponse;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendAnnouncementWithFileList: self.fileList toPeer: self.peer andIsFileIDResponse: self.isFileIDResponse];
}

@end

@implementation FTMRequestDataAction

@synthesize fileID = _fileID;
@synthesize startByte = _startByte;
@synthesize length = _length;
@synthesize maxChunkSize = _maxChunkSize;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendRequestDataUsingFileID: self.fileID startByte: self.startByte length: self.length andMaxChunkSize: self.maxChunkSize toPeer: self.peer];
}

@end

@implementation FTMDataChunkAction

@synthesize fileID = _fileID;
@synthesize startByte = _startByte;
@synthesize chunkLength = _chunkLength;
@synthesize chunk = _chunk;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendDataChunkUsingFileID: self.fileID startByte: self.startByte chunkLength: self.chunkLength andFileData: self.chunk toPeer: self.peer];
}

@end

@implementation FTMOfferFileAction

@synthesize fd = _fd;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendOfferFileWithFileDescriptor: self.fd toPeer: self.peer];
}

@end

@implementation FTMRequestAnnouncementAction

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendAnnouncementRequestToPeer: self.peer];
}

@end

@implementation FTMStopXferAction

@synthesize fileID = _fileID;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendStopDataXferForFileID: self.fileID toPeer: self.peer];
}

@end

@implementation FTMXferCancelledAction

@synthesize fileID = _fileID;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendXferCancelledForFileID: self.fileID toPeer: self.peer];
}

@end

@implementation FTMRequestOfferAction

@synthesize filePath = _filePath;

-(FTMStatusCode)transmitActionWithTransmitter: (FTMTransmitter *)transmitter
{
    return [transmitter sendRequestOfferForFileWithPath: self.filePath toPeer: self.peer];
}

@end

@implementation FTMFileIDResponseAction

@synthesize filePath = _filePath;

@end



