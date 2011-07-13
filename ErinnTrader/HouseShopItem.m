
#import "HouseShopItem.h"

@implementation HouseShopItem

@synthesize id = _id;
@synthesize name = _name;
@synthesize area = _area;
@synthesize item = _item;
@synthesize price = _price;
@synthesize comment = _comment;
@synthesize coupon = _coupon;

#pragma mark -
#pragma mark Accessor Methods

- (NSString *)formatted_price {
  int price = [[self.price stringByReplacingOccurrencesOfString:@"," 
                                                     withString:@""] floatValue];
  NSString *formatted;
  if (price < 1000) {
    formatted = [NSString stringWithFormat:@"%d", price];
  }
  else if (price < 1000000) {
    formatted = [NSString stringWithFormat:@"%dK", price / 1000];
  }
  else {
    NSDecimalNumber *decimalPrice = 
    [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithInt:price] decimalValue]];
    float floatPrice = 
    [[decimalPrice decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"1000000"]] floatValue];
    formatted = [NSString stringWithFormat:@"%.1fM", floatPrice];
  }
  return formatted;
}

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
