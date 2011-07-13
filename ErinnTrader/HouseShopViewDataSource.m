
#import "HouseShopViewDataSource.h"
#import "HouseShopModel.h"
#import "HouseShopItem.h"

@implementation HouseShopViewDataSource

@synthesize houseShopModel = _hosueShopModel;

#pragma -
#pragma Private Methods

////////////////////////////////////////////////////////////////////////////////
// logic

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
    self.houseShopModel = [[HouseShopModel alloc] init];
  }
  return self;
}

- (id)initWithSearchQuery:(NSString *)searchQuery {
  self = [super init];
  if (self) {
    self.houseShopModel = [[HouseShopModel alloc] initWithSearchQuery:searchQuery];
  }
  return self;
}

- (void)dealloc {
  self.houseShopModel = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Methods

- (id<TTModel>)model {
  return self.houseShopModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  NSMutableArray* items = [NSMutableArray array];
  for (HouseShopItem *item in self.houseShopModel.houseShopItems) {
    TTTableTextItem *tableItem = [TTTableTextItem itemWithText:item.item URL:@"tt://dev/null"];
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
