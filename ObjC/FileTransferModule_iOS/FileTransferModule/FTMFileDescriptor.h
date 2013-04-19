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
 * The FTMFileDescriptor class is the main object that is passed around to remote
 * session peers and provides valuable information regarding files that are
 * available for transfer. The file descriptor includes information regarding
 * who owns the file, the file name, the size of the file, the absolute path to the file (if
 * available) and the file ID. The file ID is the most important piece of data
 * because this is how most file transfers are initiated.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@interface FTMFileDescriptor : NSObject

/** @name Class Properties */

/**
 * Stores the name of the file owner.
 */
@property (nonatomic, copy) NSString *owner;

/**
 * Stores the shared path of the file.
 */
@property (nonatomic, copy) NSString *sharedPath;

/**
 * Stores the relative path of the file.
 */
@property (nonatomic, copy) NSString *relativePath;

/**
 * Stores the name of the file.
 */
@property (nonatomic, copy) NSString *filename;

/**
 * Stores the ID of the file.
 */
@property (nonatomic, strong) NSData *fileID;

/**
 * Stores the size of the file (specified in bytes).
 */
@property (nonatomic) NSInteger size;

/** @name Creating FTMFileDescriptor */

/**
 * Creates an empty instance of the FTMFileDescriptor.
 *
 * @return Instance of FTMFileDescriptor
 */
- (id)init;

/**
 * Creates an instance of the FTMFileDescriptor using the provided descriptor parameter.
 *
 * This method essentially acts as a copy constructor.
 *
 * @param fileDescriptor Specifies the descriptor we are copying. 
 *
 * @return Instance of FTMFileDescriptor
 */
- (id)initWithFileDescriptor: (FTMFileDescriptor *)fileDescriptor;

/**
 * Overrides a method from NSObject, so we can define what it means for two FTMFileDescriptor objects to be equal.
 *
 * This function compares the contents of two FTMFileDescriptor objects. If the contents are identical, this function
 * will return true, otherwise this function will return false.
 *
 * @param other Specifies the descriptor we are comparing to.
 *
 * @return True if the object contents are identical, false otherwise.
 */
- (BOOL)isEqual: (id)other;

/**
 * Compares the contents of two FTMFileDescriptor objects to determine equality.
 *
 * @param that Specifies the descriptor we are comparing to.
 *
 * @return True if the object contents are identical, false otherwise.
 */
- (BOOL)isEqualToFileDescriptor: (FTMFileDescriptor *)that;

/**
 * Overrides a method from NSObject and returns the hash value of a FTMFileDescriptor object.
 *
 * @warning *Note:* Overriding this object was necessary since we overrode the isEqual: function
 * from NSObject.
 */
- (NSUInteger)hash;

@end
