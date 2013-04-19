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

#import "FTMMockDispatcher.h"

@implementation FTMMockDispatcher

@synthesize statusCodeToReturn = _statusCodeToReturn;
@synthesize callerIs = _callerIs;
@synthesize allowDispatching = _allowDispatching;

-(id)init
{
    self = [super init];
	
	if (self)
    {
        self.statusCodeToReturn = FTMOK;
        self.callerIs = @"";
        self.allowDispatching = NO;
    }
	
	return self;
}

-(void)insertAction: (FTMAction *)action
{
    if (self.allowDispatching)
    {
        [super insertAction: action];
    }
}

-(FTMStatusCode)transmitImmediately: (FTMAction *)action
{
    if ([self.callerIs isEqualToString:@"OfferManagerTests"])
    {
        return self.statusCodeToReturn;
    }
    else
    {
        return [super transmitImmediately: action];
    }
}


@end
