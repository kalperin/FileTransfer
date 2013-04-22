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

#import "AnnounceViewController.h"

@interface AnnounceViewController()

@end

@implementation AnnounceViewController

- (id)initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    return self;
}

- (void)viewWillAppear: (BOOL)animated
{
    [self.navigationController setNavigationBarHidden: NO animated: animated];
    [super viewWillAppear: animated];
}

- (void)viewWillDisappear: (BOOL)animated
{
    [self.navigationController setNavigationBarHidden: YES animated: animated];
    [super viewWillDisappear: animated];
}

- (IBAction)announceFileClicked: (id)sender
{
    [self showPicturePicker: self.announcementController];
}

- (IBAction)announceDocsClicked: (id)sender
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    [self.announcementController announceDirectoryWithPath: path];
}

/*
 * Private helper function that displays an image picker for the user. This function is called when the user wishes
 * to announce or offer a file and the image picker allows them to select the file they want to announce or offer.
 */
-(void)showPicturePicker: (id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: sourceType];
    
    if ([UIImagePickerController isSourceTypeAvailable: sourceType] && [mediaTypes count] > 0)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = delegate;
        picker.sourceType = sourceType;
        
        [self presentViewController: picker animated: YES completion: nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error accessing media" message: @"Device doesn't support that media source" delegate: nil cancelButtonTitle: @"Cancel" otherButtonTitles: nil];
        [alert show];
    }
}
@end
