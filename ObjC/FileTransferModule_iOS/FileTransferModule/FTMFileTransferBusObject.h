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
#import "FileTransferBusObject.h"
#import "FTMDirectedAnnouncementManagerDelegate.h"
#import "FTMSendManagerDelegate.h"
#import "FTMOfferManagerDelegate.h"
#import "FTMMessageUtility.h"

/**
 * The FTMFileTransferBusObject is registered with the AllJoyn Bus Attachment and exposes
 * the Data Transfer and File Discovery interfaces to remote session peers. This object
 * listens and responds to remote method calls (not to be confused with signals) made by
 * AllJoyn session peers. Methods are used when a response is needed quickly since signals
 * are too slow. The three methods handled by the bus object are: requestData, requestOffer,
 * and offerFile.
 * 
 * @warning *Note:* This class is not intended to be used directly. All of the
 * supported functionality of this library is intended to be accessed through the
 * FTMFileTransferModule class.
 */
@interface FTMFileTransferBusObject : FileTransferBusObject

/** @name Class Properties */

/**
 * Sets a delegate so the FTMFileTransferBusObject can callback to the FTMDirectedAnnouncementManager.
 *
 * The FTMDirectedAnnouncementManagerDelegate will notify the FTMDirectedAnnouncementManager that an offer
 * request was received.
 *
 * @warning *Note:* This property is write only and does not provide a getter.
 */
@property (nonatomic, strong) id<FTMDirectedAnnouncementManagerDelegate> directedAnnouncementManagerDelegate;

/**
 * Sets a delegate so the FTMFileTransferBusObject can callback to the FTMSendManager.
 *
 * The FTMSendManagerDelegate will notify the FTMSendManager to start sending a file immediately.
 *
 * @warning *Note:* This property is write only and does not provide a getter.
 */
@property (nonatomic, strong) id<FTMSendManagerDelegate> sendManagerDelegate;

/**
 * Sets a delegate so the FTMFileTransferBusObject can callback to the FTMOfferManager.
 *
 * The FTMOfferManagerDelegate will notify the FTMOfferManager when a file offer is received
 * from a remote session peer.
 *
 * @warning *Note:* This property is write only and does not provide a getter.
 */
@property (nonatomic, strong) id<FTMOfferManagerDelegate> offerManagerDelegate;

@end
