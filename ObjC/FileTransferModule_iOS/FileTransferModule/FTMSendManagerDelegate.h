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
#import "FTMStatusCode.h"

/**
 * The FTMSendManagerDelegate is an internal delegate that is used by the FTMOfferManager,
 * the FTMFileTransferBusObject, FTMDispatcher, and the FTMReceiver to notify the FTMSendManager 
 * that various events have occurred. Such events include: start sending a file, queue the next
 * file chunk, and handle a stop data transfer signal sent by the file receiver.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@protocol FTMSendManagerDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered by the FTMFileTransferBusObject or the FTMOfferManager to begin sending the file matching the specified file ID.
 *
 * @param fileID Specifies the ID of the file being transferred.
 * @param startByte Specifies the starting byte of the data relative to the file.
 * @param length Specifies the length of data chunk.
 * @param peer Specifies the peer receiving the file.
 * @param maxChunkLength Specifies the maximum file chunk size.
 *
 * @return FTMStatusCode FTMOK or FTMBadFileID.
 */
-(FTMStatusCode)sendFileWithID: (NSData *)fileID withStartByte: (int)startByte andLength: (int)length andMaxChunkLength: (int)maxChunkLength toPeer: (NSString *)peer;

/**
 * Triggered by the FTMDispatcher to queue the next file chunk, if available.
 */
-(void)dataSent;

/**
 * Triggered by the FTMReceiver to tell the FTMSendManager the receiver has cancelled the file transfer.
 *
 * @param fileID Specifies the ID of the file being transferred.
 * @param peer Specifies the peer receiving the file.
 */
-(void)handleStopDataXferForFileWithID: (NSData *)fileID fromPeer: (NSString *)peer;

@end
