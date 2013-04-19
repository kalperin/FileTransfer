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

@class TableViewController;

/*
 * This delegate is used extract the selection that the user made on the TableViewController. This
 * can either be a peer name (i.e. request offer, offer file, etc.) or a file name (i.e. request file).
 * This delegate allows us to specify a different controller class as a delegate depending on which
 * table type we are displaying. This, in turn, removes case statements and allows us to just process 
 * the data as needed without needing to determine a course of action first.
 */
@protocol SelectionMadeDelegate <NSObject>

@required
-(void)selectionMade: (NSString*)selectedString on: (TableViewController *)tableViewController;

@end
