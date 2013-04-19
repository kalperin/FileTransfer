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

#import <UIKit/UIKit.h>
#import "SelectionMadeDelegate.h"

/*
 * This class extends UITableViewController and allows us to specify an array of strings to display,
 * a delegate to call when the user selects a given cell, and table type. This allows tremendous 
 * flexibility to reuse the table regardless of whether we are displaying peer names of file names.
 * The delegate allows us to specify a controller class that will receive the callback when a user
 * selects a row.
 */
@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSArray *stringsToDisplay;
@property (nonatomic, strong) id<SelectionMadeDelegate> selectionMadeDelegate;

@end
