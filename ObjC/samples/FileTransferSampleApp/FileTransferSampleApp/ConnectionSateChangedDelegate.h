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

typedef enum
{
    CONNECTED,
    HOSTING,
    JOINING,
    DISCONNECTED
} ConnectionState;

/*
 * This delegate is used by the AllJoynManager class and allows the class to call back
 * to the ViewController and notify them of any changes in connection state. All changes
 * in connection state are displayed for the user in the text box on the main screen of
 * the sample app (i.e. when the app joins a session you should see the textbox display
 * the word "connected").
 */
@protocol ConnectionSateChangedDelegate <NSObject>

@required
- (void)connectionStateChanged: (ConnectionState)state;

@end
