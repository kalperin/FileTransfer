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

#import "FTMFileDescriptor.h"

@implementation FTMFileDescriptor

@synthesize owner = _owner;
@synthesize sharedPath = _sharedPath;
@synthesize relativePath = _relativePath;
@synthesize filename = _filename;
@synthesize fileID = _fileID;
@synthesize size = _size;

- (id)init
{
	return [self initWithFileDescriptor: nil];	
}

- (id)initWithFileDescriptor: (FTMFileDescriptor *)fileDescriptor
{
	self = [super init];
	
	if (self && fileDescriptor) {
		self.owner = fileDescriptor.owner;
		self.sharedPath = fileDescriptor.sharedPath;
		self.relativePath = fileDescriptor.relativePath;
		self.filename = fileDescriptor.filename;
		self.fileID = fileDescriptor.fileID;
		self.size = fileDescriptor.size;
	}
	
	return self;
}

- (BOOL)isEqual: (id)other
{
	if (other == nil) {
		return NO;
	}

	if (other == self) {
		return YES;
	}
	
	if (![other isKindOfClass: [self class]]) {
		return NO;
	}
	
	return [self isEqualToFileDescriptor: other];
}

- (BOOL)isEqualToFileDescriptor: (FTMFileDescriptor *)that
{
	return
		[self.owner isEqual: that.owner] &&
		[self.sharedPath isEqual: that.sharedPath] &&
		[self.relativePath isEqual: that.relativePath] &&
		[self.fileID isEqual: that.fileID] &&
		self.size == that.size;
}

- (NSUInteger)hash
{
	const int prime = 31;
	int result = 1;
	
	result = (prime * result) + (self.owner ? [self.owner hash] : 0);
	result = (prime * result) + (self.sharedPath ? [self.sharedPath hash] : 0);
	result = (prime * result) + (self.relativePath ? [self.relativePath hash] : 0);
	result = (prime * result) + (self.filename ? [self.filename hash] : 0);
	result = (prime * result) + (self.fileID ? [self.fileID hash] : 0);
	result = (prime * result) + self.size;
	
	return result;	
}

@end