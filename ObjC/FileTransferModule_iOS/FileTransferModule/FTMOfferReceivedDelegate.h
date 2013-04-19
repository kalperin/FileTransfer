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
#import "FTMFileDescriptor.h"

/**
 * The FTMOfferReceivedDelegate can be used by developers to determine the default
 * action taken when a file offer is received from a session peer. The default
 * behavior is to deny all file offers. The function acceptFileOfferFrom:forFile:
 * should be implemented to return to true if you wish to accept files offered by
 * remote session peers.
 * 
 * See [FTMFileTransferModule setOfferReceivedDelegate:].
 */
@protocol FTMOfferReceivedDelegate <NSObject>

@required

/** @name Required Methods */

/**
 * Triggered when a file offer is received. 
 * 
 * If the delegate is not implemented, the offer will be rejected by default.
 *
 * @param peer Specifies the peer offering the file.
 * @param file Specifies the FTMFileDescriptor for the file being offered.
 *
 * @return True to accept the offer, false to reject the offer.
 */
-(BOOL)acceptFileOfferFrom: (NSString *)peer forFile: (FTMFileDescriptor *)file;

@end
