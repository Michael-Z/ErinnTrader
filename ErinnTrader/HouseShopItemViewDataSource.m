
#import "HouseShopItemViewDataSource.h"
#import "AppHelper.h"

@interface HouseShopItemViewDataSource()
@end

@implementation HouseShopItemViewDataSource

@synthesize houseShopItem = _houseShopItem;

#pragma -
#pragma Private Methods

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (id)initWithHouseShopItem:(HouseShopItem *)houseShopItem {
  self = [self init];
  if (self) {
    self.houseShopItem = houseShopItem;
  }
  return self;
}


- (void)dealloc {
  self.houseShopItem = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Methods

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  NSMutableArray* items = [NSMutableArray array];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.item caption:@"item"]];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.price caption:@"price"]];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.area caption:@"area"]];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.name caption:@"name"]];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.comment caption:@"comment"]];
  [items addObject:[TTTableCaptionItem itemWithText:self.houseShopItem.coupon caption:@"coupon"]];
  self.items = items;
}

@end
