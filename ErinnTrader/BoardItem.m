
#import "BoardItem.h"

@implementation BoardItem

@synthesize id = _id;
@synthesize title = _title;
@synthesize author = _author;
@synthesize content = _content;
@synthesize url = _url;
@synthesize published = _published;

#pragma -
#pragma Inheritance Methods

- (void)dealloc {
  self.title = nil;
  self.author = nil;
  self.content = nil;
  self.url = nil;
	[super dealloc];
}

@end
