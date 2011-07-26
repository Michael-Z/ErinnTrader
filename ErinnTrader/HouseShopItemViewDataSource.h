
#import <Foundation/Foundation.h>
#import "HouseShopItem.h"

@interface HouseShopItemViewDataSource : TTListDataSource {
@private
  HouseShopItem *_houseShopItem;
}
@property (nonatomic, retain) HouseShopItem *houseShopItem;
- (id)initWithHouseShopItem:(HouseShopItem *)houseShopItem;
@end
