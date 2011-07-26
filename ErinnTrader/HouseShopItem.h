
#import <Foundation/Foundation.h>

@interface HouseShopItem : NSObject {
 @private  
  NSInteger _id;
  NSString *_name;
  NSString *_area;
  NSString *_item;
  NSString *_price;
  NSString *_comment;
  NSString *_coupon;
}
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *item;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *coupon;
@end
