
#import "HouseShopItem.h"

@implementation HouseShopItem

@synthesize id = _id;
@synthesize name = _name;
@synthesize area = _area;
@synthesize item = _item;
@synthesize price = _price;
@synthesize comment = _comment;
@synthesize coupon = _coupon;

#pragma -
#pragma Inheritance Methods

- (void)dealloc {
  self.name = nil;
  self.area = nil;
  self.item = nil;
  self.price = nil;
  self.comment = nil;
  self.coupon = nil;
	[super dealloc];
}

@end
