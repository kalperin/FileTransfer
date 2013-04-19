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
#import "SelectionMadeDelegate.h"
#import "FileTransferOperationsDelegate.h"
#import "TableViewController.h"

/*
 * This class is designated as the delegate when the user presses the "Request Offer" button
 * and receives a callback when the user selects the peer name from the TableViewController.
 * This class then pops up an alert view and allows the user to input the relative path to
 * the file they are requesting (with respect to the applications home directory) and then
 * delegates to the ViewController class to send the offer request using the File Transfer
 * Module.
 */
@interface RequestOfferDelegate : NSObject <SelectionMadeDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) id<FileTransferOperationsDelegate> operationsDelegate;

@end
