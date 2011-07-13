
#import "BoardViewDataSource.h"
#import "BoardModel.h"
#import "BoardItem.h"

@implementation BoardViewDataSource

@synthesize boardModel = _boardModel;

#pragma -
#pragma Private Methods

////////////////////////////////////////////////////////////////////////////////
// logic

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
    self.boardModel = [[BoardModel alloc] init];
  }
  return self;
}

- (id)initWithSearchQuery:(NSString *)searchQuery {
  self = [super init];
  if (self) {
    self.boardModel = [[BoardModel alloc] initWithSearchQuery:searchQuery];
  }
  return self;
}

- (void)dealloc {
  self.boardModel = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Methods

- (id<TTModel>)model {
  return self.boardModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  NSMutableArray* items = [NSMutableArray array];
  for (BoardItem *item in self.boardModel.boardItems) {
    TTTableTextItem *tableItem = [TTTableTextItem itemWithText:item.title URL:@"tt://dev/null"];
    tableItem.userInfo = item;
    [items addObject:tableItem];
  }
  self.items = items;
}

- (NSString*)titleForLoading:(BOOL)reloading {
  if (reloading) {
    return @"Updating BoardItem...";
  } else {
    return @"Loading BoardItem...";
  }
}

- (NSString*)titleForEmpty {
  return @"No BoardItems found.";
}

- (NSString*)subtitleForError:(NSError*)error {
  return @"Sorry, there was an error loading the BoardItem.";
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
  return [super tableView:tableView cellClassForObject:object];  
}  

@end
