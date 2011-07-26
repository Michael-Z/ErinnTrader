
#import "HouseShopViewDataSource.h"
#import "HouseShopModel.h"
#import "HouseShopItem.h"
#import "ETTableHouseShopItem.h"
#import "ETTableHouseShopItemCell.h"

@implementation HouseShopViewDataSource

@synthesize houseShopModel = _hosueShopModel;

#pragma -
#pragma Private Methods

////////////////////////////////////////////////////////////////////////////////
// Accessor

- (NSString *)formattedPriceForItem:(HouseShopItem *)item {
  int price = [[item.price stringByReplacingOccurrencesOfString:@"," 
                                                     withString:@""] floatValue];
  NSString *formattedPrice;
  if (price < 1000) {
    formattedPrice = [NSString stringWithFormat:@"%d", price];
  }
  else if (price < 1000000) {
    formattedPrice = [NSString stringWithFormat:@"%dK", price / 1000];
  }
  else {
    NSDecimalNumber *decimalPrice = 
    [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithInt:price] decimalValue]];
    float floatPrice = 
    [[decimalPrice decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"1000000"]] floatValue];
    formattedPrice = [NSString stringWithFormat:@"%.1fM", floatPrice];
  }
  return formattedPrice;
}

#pragma -
#pragma Inheritance Methods

- (id)init {
//  self = [super init];
  if (self = [super init]) {
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
    ETTableHouseShopItem *tableItem = [ETTableHouseShopItem itemWithText:item.item 
                                                                 caption:[self formattedPriceForItem:item]
                                                                     URL:@"tt://dev/null"];
    tableItem.userInfo = item;
    [items addObject:tableItem];
  }
  
  if (!self.houseShopModel.finished) {
    [items addObject:[TTTableMoreButton itemWithText:@"more…"]];
  }

  self.items = items;
}

- (NSString*)titleForLoading:(BOOL)reloading {
  if (reloading) {
    return @"Updating HouseShop Items...";
  } else {
    return @"Loading HouseShop Items...";
  }
}

- (NSString*)titleForEmpty {
  return @"No HouseShop Items found.";
}

- (NSString*)subtitleForError:(NSError*)error {
  return @"Sorry, there was an error loading the HouseShop Items.";
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
  if ([object isKindOfClass:[ETTableHouseShopItem class]]) {  
    return [ETTableHouseShopItemCell class];  
  } else {  
    return [super tableView:tableView cellClassForObject:object];  
  }  
}  

@end
