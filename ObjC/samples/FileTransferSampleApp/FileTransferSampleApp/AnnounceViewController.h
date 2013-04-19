//
//  AnnounceViewController.h
//  FileTransferSampleApp
//
//  Created by Smith, James on 4/15/13.
//  Copyright (c) 2013 Smith, James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnouncementDelegate.h"

@interface AnnounceViewController : UIViewController

@property (strong, nonatomic) AnnouncementDelegate *announcementController;

- (IBAction)announceFileClicked: (id)sender;
- (IBAction)announceDocsClicked: (id)sender;

@end
