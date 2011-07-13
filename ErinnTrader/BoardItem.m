
#import "BoardItem.h"

@implementation BoardItem

@synthesize id = _id;
@synthesize title = _title;
@synthesize author = _author;
@synthesize content = _content;
@synthesize published = _published;

#pragma -
#pragma Inheritance Methods

- (void)dealloc {
  self.title = nil;
  self.author = nil;
  self.content = nil;
	[super dealloc];
}

@end
