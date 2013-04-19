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
#import "FTMFileDescriptor.h"

/**
 * The FTMOfferManagerDelegate is an internal delegate that is used by the FTMFileTransferBusObject
 * to see if there are any pending offers that are awaiting response from a remote session peer. 
 * This delegate is also used to respond to offers received from remote session peers.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@protocol FTMOfferManagerDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered by the FTMFileTransferBusObject to see if the file ID matches a pending offer.
 *
 * @param fileID Specifies the file ID of the file being requested.
 *
 * @return True if the file ID matches a pending offer, false otherwise.
 */
-(BOOL)isOfferPendingForFileWithID: (NSData *)fileID;

/**
 * Triggered by the FTMFileTransferBusObject to handle a file request that is in response to a pending offer.
 *
 * @param peer Specifies the peer making the file request.
 * @param fileID Specifies the ID of the requested file.
 * @param startByte Specifies the starting byte of the request relative to the file.
 * @param length Specifies the length of request in bytes.
 * @param maxChunkLength Specifies the max file chunk size.
 *
 * @return FTMStatusCode FTMOK or FTMBadFileID.
 */
-(FTMStatusCode)handleRequestFrom: (NSString *)peer forFileID: (NSData *)fileID usingStartByte: (int)startByte withLength: (int)length andMaxChunkLength: (int)maxChunkLength;

/**
 * Triggered by the FTMFileTransferBusObject to handle the offer received from a remote session peer.
 *
 * @param peer Specifies the peer offering the file.
 * @param file Specifies the FTMFileDescriptor for the file being offered.
 *
 * @return FTMStatusCode FTMOfferAccepted or FTMOfferRejected.
 */
-(FTMStatusCode)handleOfferFrom: (NSString *)peer forFile: (FTMFileDescriptor *)file;

@end
