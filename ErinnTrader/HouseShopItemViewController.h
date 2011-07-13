
#import <UIKit/UIKit.h>
#import "HouseShopItem.h"

@interface HouseShopItemViewController : TTViewController {
 @private  
  HouseShopItem *_houseShopItem;
}
@property (nonatomic, assign) HouseShopItem *houseShopItem;
@end
