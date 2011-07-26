
#import "ETTableHouseShopItemCell.h"
#import "ETTableHouseShopItem.h"
#import "ETDefaultStyleSheet.h"

@implementation ETTableHouseShopItemCell

#pragma -
#pragma Inheritance Methods

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
  self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
  if (self) {  
    _item = nil;
  }  
  return self;  
}  

- (void)dealloc {  
  [super dealloc];  
}

#pragma -
#pragma UIView Methods

- (void)layoutSubviews {  
  [super layoutSubviews];
}

#pragma -
#pragma TTTableViewCell Methods

- (id)object {  
  return _item;  
} 

- (void)setObject:(id)object {
  if (_item != object) {
    [super setObject:object];
  }
}

@end
