
#import <UIKit/UIKit.h>
#import "HouseShopItem.h"

@interface HouseShopItemViewController : TTTableViewController {
 @private  
  HouseShopItem *_houseShopItem;
}
@property (nonatomic, assign) HouseShopItem *houseShopItem;
@end
