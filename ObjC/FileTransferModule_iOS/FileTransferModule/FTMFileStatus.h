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

/**
 * The FTMFileStatus object is used by the FTMSendManager and the 
 * FTMReceiveManager to monitor the progress of files that are being sent and
 * received. From the senders perspective, the file status will show the file
 * ID of the file being transferred, the length of the file, the peer receiving
 * the file, how many bytes have already been sent, and the maximum chunk
 * length specified by the receiver. From the receivers perspective, all of
 * same data is monitored by the receiver with a few additions. The receiver
 * also keeps track of the save file name and the save file path. This is
 * essential so the file chunks can be appended to the correct file.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@interface FTMFileStatus : NSObject

/** @name Class Properties */

/**
 * Specifies the ID of the file being transferred.
 */
@property (nonatomic) NSData *fileID;

/**
 * Specifies the staring position within the file.
 */
@property (nonatomic) int startByte;

/**
 * Specifies the length of the file.
 */
@property (nonatomic) int length;

/**
 * Specifies the owner of the file.
 */
@property (nonatomic) NSString *peer;

/**
 * Specifies the number of bytes that have been transferred.
 */
@property (nonatomic) int numBytesSent;

/**
 * Specifies the name to save the file.
 */
@property (nonatomic) NSString *saveFileName;

/**
 * Specifies the absolute path of the save directory.
 */
@property (nonatomic) NSString *saveFilePath;

/**
 * Specifies the maximum allowed file chunk size.
 */
@property (nonatomic) int chunkLength;

@end
