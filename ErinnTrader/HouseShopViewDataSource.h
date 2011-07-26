
#import <Foundation/Foundation.h>
#import "HouseShopModel.h"

@interface HouseShopViewDataSource : TTListDataSource {
 @private
  HouseShopModel *_houseShopModel;
}
@property (nonatomic, retain) HouseShopModel *houseShopModel;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
