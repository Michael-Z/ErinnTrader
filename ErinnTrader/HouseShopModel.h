
#import <Foundation/Foundation.h>

@interface HouseShopModel : TTURLRequestModel {
 @private 
  NSMutableArray *_houseShopItems;
  NSString *_searchQuery;
  NSInteger _page;
  BOOL _finished;
}
@property (nonatomic, retain) NSMutableArray *houseShopItems;
@property (nonatomic, copy) NSString *searchQuery;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL finished;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
