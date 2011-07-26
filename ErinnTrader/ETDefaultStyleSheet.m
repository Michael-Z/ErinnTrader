
#import "ETDefaultStyleSheet.h"

@implementation ETDefaultStyleSheet

- (UIColor*)boardItemHeadingColor {
  return [UIColor blackColor];
}

- (UIFont*)boardItemHeadingFont {
  return [UIFont boldSystemFontOfSize:13];
}

- (UIColor*)boardItemSubtextColor {
  return [UIColor grayColor];
}

- (UIFont*)boardItemSubtextFont {
  return [UIFont boldSystemFontOfSize:11];
}

@end
