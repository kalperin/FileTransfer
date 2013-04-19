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

#import "FTMTransmitter.h"

@interface FTMTransmitter()

/*
 * Stores the AllJoyn session ID.
 */
@property (nonatomic) AJNSessionId sessionID;

/*
 * Stores an instance of the AllJoyn bus attachment.
 */
@property (nonatomic, strong) AJNBusAttachment *busAttachment;

/*
 * Stores an instance of the FTMFileTransferBusObject.
 */
@property (nonatomic, strong) FTMFileTransferBusObject *busObject;

@end

@implementation FTMTransmitter

@synthesize sessionID = _sessionID;
@synthesize busAttachment = _busAttachment;
@synthesize busObject = _busObject;

-(id)initWithBusObject: (FTMFileTransferBusObject *)busObject busAttachment: (AJNBusAttachment *)busAttachment andSessionID: (AJNSessionId)sessionID
{
    self = [super init];
	
	if (self)
    {
		self.busObject = busObject;
        self.busAttachment = busAttachment;
        self.sessionID = sessionID;
        
        if (self.busAttachment)
        {
            QStatus status = [self.busAttachment registerBusObject: self.busObject];
            NSLog(@"registering bus object returned %@", [AJNStatus descriptionForStatusCode:status]);
        }
	}
	
	return self;
}

-(FTMStatusCode)sendAnnouncementWithFileList: (NSArray *)fileList toPeer: (NSString *)peer andIsFileIDResponse: (BOOL)isFileIDResponse
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    AJNMessageArgument *msgArg = [FTMMessageUtility messageArgumentFromFileList:fileList];
    
    [self.busObject sendAnnounceWithFileList:msgArg andIsFileIDResponse:isFileIDResponse inSession:self.sessionID toDestination:peer];

    return FTMOK;
}

-(FTMStatusCode)sendRequestDataUsingFileID: (NSData *)fileID startByte: (int)startByte length: (int)length andMaxChunkSize: (int)maxChunkSize toPeer:(NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    FileTransferBusObjectProxy *fileTransferObjectProxy = [[FileTransferBusObjectProxy alloc] initWithBusAttachment: self.busAttachment serviceName: peer objectPath: kObjectPath sessionId: self.sessionID];
    [fileTransferObjectProxy introspectRemoteObject];
    
    NSNumber *returnValue = [fileTransferObjectProxy requestDataWithFileID:[FTMMessageUtility messageArgumentFromFileID:fileID] startByte:[NSNumber numberWithInt:startByte] length:[NSNumber numberWithInt:length] andMaxChunkLength:[NSNumber numberWithInt:maxChunkSize]];
    
    return [returnValue intValue];
}

-(FTMStatusCode)sendDataChunkUsingFileID: (NSData *)fileID startByte: (int)startByte chunkLength: (int)chunkLength andFileData: (NSData *)chunk toPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    [self.busObject sendDataChunkWithFileID:[FTMMessageUtility messageArgumentFromFileID:fileID] startByte:[NSNumber numberWithInt:startByte] length:[NSNumber numberWithInt:chunkLength] andFileChunk:[FTMMessageUtility messageArgumentFromData:chunk] inSession:self.sessionID toDestination:peer];
    
    return FTMOK;
}

-(FTMStatusCode)sendOfferFileWithFileDescriptor: (FTMFileDescriptor *)fd toPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    AJNMessageArgument *msgArg = [FTMMessageUtility messageArgumentFromFileDescriptor:fd];
    
    FileTransferBusObjectProxy *fileTransferObjectProxy = [[FileTransferBusObjectProxy alloc] initWithBusAttachment: self.busAttachment serviceName: peer objectPath: kObjectPath sessionId: self.sessionID];
    [fileTransferObjectProxy introspectRemoteObject];
    
    NSNumber *returnValue = [fileTransferObjectProxy offerFileWithFileDescriptor:msgArg];
    
    return [returnValue intValue];
}

-(FTMStatusCode)sendAnnouncementRequestToPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    [self.busObject sendrequestAnnouncementInSession: self.sessionID toDestination: peer];
    return FTMOK;
}

-(FTMStatusCode)sendStopDataXferForFileID: (NSData *)fileID toPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    [self.busObject sendStopDataXferWithFileID:[FTMMessageUtility messageArgumentFromFileID:fileID] inSession:self.sessionID toDestination:peer];
    
    return FTMOK;
}

-(FTMStatusCode)sendXferCancelledForFileID: (NSData *)fileID toPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    [self.busObject sendDataXferCancelledWithFileID: [FTMMessageUtility messageArgumentFromFileID:fileID] inSession:self.sessionID toDestination:peer];
    
    return FTMOK;
}

-(FTMStatusCode)sendRequestOfferForFileWithPath: (NSString *)filePath toPeer: (NSString *)peer
{
    if ((nil == self.busAttachment) || (nil == self.busObject))
    {
        return FTMNOAjConnection;
    }
    
    FileTransferBusObjectProxy *fileTransferObjectProxy = [[FileTransferBusObjectProxy alloc] initWithBusAttachment: self.busAttachment serviceName: peer objectPath: kObjectPath sessionId: self.sessionID];
    [fileTransferObjectProxy introspectRemoteObject];
    
    NSNumber *returnValue = [fileTransferObjectProxy requestOfferWithFilePath: filePath];
    
    return [returnValue intValue];
}

@end
