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

#import "RequestOfferDelegate.h"

@interface RequestOfferDelegate()

@property (nonatomic, strong) NSString *peer;

-(void)showRequestOfferAlertView;

@end

@implementation RequestOfferDelegate

@synthesize operationsDelegate = _operationsDelegate;

/*
 * Called when the user selects the peer name from the TableViewController. The selected peer
 * name is saved in a property and a private function is called to show the alert view.
 */
-(void)selectionMade: (NSString*)selectedString on: (TableViewController *)tableViewController
{
    self.peer = selectedString;
    [self showRequestOfferAlertView];
}

/*
 * Shows an alert view to the user and allows them to enter the relative path to the file they
 * are requesting.
 */
-(void)showRequestOfferAlertView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Request Offer" message: @"Please enter a relative path for the file:" delegate: self cancelButtonTitle: @"Continue" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *alertTextField = [alert textFieldAtIndex: 0];
    alertTextField.keyboardType = UIKeyboardTypeDefault;
    alertTextField.placeholder = @"Enter a realtive path";
    
    [alert show];
}

/*
 * Callback method from the UIAlertView that extracts the file path entered and delegates back to the
 * ViewController class so the offer request can be sent.
 */
#pragma mark UIAlertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *filePath = [[NSString alloc] initWithString: [alertView textFieldAtIndex: 0].text];
    
    if (self.operationsDelegate != nil)
    {
        [self.operationsDelegate sendOfferRequestForFileWithPath: filePath toPeer: self.peer];
    }
}

@end
