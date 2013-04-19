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

#import "FTMFileTransferBusObject.h"

@implementation FTMFileTransferBusObject

- (NSNumber*)requestDataWithFileID:(AJNMessageArgument*)fileID startByte:(NSNumber*)startByte length:(NSNumber*)length andMaxChunkLength:(NSNumber*)maxChunkLength fromSender:(NSString *)sender
{
    NSLog(@"received request data from: %@", sender);
    
    NSData *fileIDData = [FTMMessageUtility fileIDFromMessageArgument: fileID];
    int receivedStartByte = [startByte intValue];
    int receivedLength = [length intValue];
    int receivedMaxChunkLength = [maxChunkLength intValue];
    
    FTMStatusCode returnValue = FTMInvalid;
    
    if (self.offerManagerDelegate != nil && [self.offerManagerDelegate isOfferPendingForFileWithID:fileIDData])
    {
        returnValue = [self.offerManagerDelegate handleRequestFrom:sender forFileID:fileIDData usingStartByte: receivedStartByte withLength: receivedLength andMaxChunkLength: receivedMaxChunkLength];
    }
    else if (self.sendManagerDelegate != nil)
    {
        returnValue = [self.sendManagerDelegate sendFileWithID: fileIDData withStartByte: receivedStartByte andLength: receivedLength andMaxChunkLength: receivedMaxChunkLength toPeer: sender];
    }
    return [NSNumber numberWithInt: returnValue];
}

- (NSNumber*)requestOfferWithFilePath:(NSString*)filePath fromSender:(NSString *)sender
{
    NSLog(@"received request offer from: %@", sender);
    
    FTMStatusCode returnValue = FTMInvalid;
    
    if (self.directedAnnouncementManagerDelegate != nil)
    {
        returnValue = [self.directedAnnouncementManagerDelegate handleOfferRequestForFile:filePath fromPeer:sender];
    }
    return [NSNumber numberWithInt: returnValue];
}

- (NSNumber*)offerFileWithFileDescriptor:(AJNMessageArgument*)file fromSender:(NSString *)sender
{
    NSLog(@"received offer from: %@", sender);
    
    FTMFileDescriptor *descriptor = [FTMMessageUtility descriptorFromMessageArgument: file];
    
    FTMStatusCode returnValue = FTMInvalid;
    
    if (self.offerManagerDelegate != nil)
    {
        returnValue = [self.offerManagerDelegate handleOfferFrom:sender forFile:descriptor];
    }
    return [NSNumber numberWithInt: returnValue];
}

@end
