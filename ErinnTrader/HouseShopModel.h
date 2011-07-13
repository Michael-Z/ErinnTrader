
#import <Foundation/Foundation.h>

@interface HouseShopModel : TTURLRequestModel {
 @private 
  NSMutableArray *_houseShopItems;
  NSString *_searchQuery;
}
@property (nonatomic, retain) NSMutableArray *houseShopItems;
@property (nonatomic, copy) NSString *searchQuery;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
