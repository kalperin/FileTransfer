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

#import "OfferFileDelegate.h"

@interface OfferFileDelegate()

@property (nonatomic, strong) NSString *peer;
@property (nonatomic, strong) UIImage *chosenImage;

-(void)showAlertView;

@end

@implementation OfferFileDelegate

@synthesize operationsDelegate = _operationsDelegate;
@synthesize peer = _peer;
@synthesize chosenImage = _chosenImage;

/*
 * Called when the user selects the peer name from the TableViewController. The selected peer
 * name is saved in a property and control is delegated back to the ViewController class to
 * display the image picker.
 */
-(void)selectionMade: (NSString*)selectedString on: (TableViewController *)tableViewController
{
    self.peer = selectedString;
        
    if (self.operationsDelegate != nil)
    {
        [self.operationsDelegate prepareOfferFile];
    }    
}

/*
 * Callback method for the UIImagePickerController thats extracts the image the user selected from
 * the image picker. This function stores the selected image in a property and then calls a private 
 * method to allow the user to enter the file name.
 */
#pragma mark UIImagePickerController delegate methods
-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo: (NSDictionary *)info
{
    NSString *lastChosenMediaType = [[NSString alloc] initWithString: [info objectForKey: UIImagePickerControllerMediaType]];
    
    if ([lastChosenMediaType isEqual: (NSString *)kUTTypeImage])
    {
        UIImage *chosenImage = [info objectForKey: UIImagePickerControllerOriginalImage];
        self.chosenImage = chosenImage;
        [self showAlertView];
    }
    else
    {
        NSLog(@"Unsupported type selected");
    }
    
    [picker dismissViewControllerAnimated: YES completion: nil];
}

/*
 * Callback method for the UIImagePickerController that dismisses the picker when the cancel button
 * is pressed and does not take any further action.
 */
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated: YES completion: nil];
}

/*
 * Shows an alert view to the user and allows them to enter the name of the file they are offering.
 */
-(void)showAlertView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Stop" message: @"Please enter a name for the file:" delegate: self cancelButtonTitle: @"Continue" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *alertTextField = [alert textFieldAtIndex: 0];
    alertTextField.keyboardType = UIKeyboardTypeDefault;
    alertTextField.placeholder = @"Enter a file name";
    
    [alert show];
}

/*
 * Callback method from the UIAlertView that extracts the file name entered and delegates back to the
 * ViewController class so the offer can be sent.
 */
#pragma mark UIAlertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *fileName = [[NSString alloc] initWithString: [alertView textFieldAtIndex: 0].text];
    fileName = ([fileName hasSuffix: @".png"]) ? fileName : [fileName stringByAppendingString: @".png"];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    path = [path stringByAppendingPathComponent: @"Sending"];
    path = [path stringByAppendingPathComponent: fileName];
    
    NSData *chosenImageData = UIImagePNGRepresentation(self.chosenImage);
    
    [chosenImageData writeToFile: path atomically: YES];
    
    if (self.operationsDelegate != nil)
    {
        [self.operationsDelegate offerFileWithFilePath: path toPeer: self.peer];
    }
}

@end
