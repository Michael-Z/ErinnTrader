
#import "UIBarButtonItem+ButtonType.h"

@implementation UIBarButtonItem (UIBarButtonItem_ButtonType)

+ (id)buttonWithType:(UIButtonType)buttonType target:(id)target action:(SEL)action {
  UIButton *button = [UIButton buttonWithType:buttonType];
  [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *barButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
  return barButtonItem;
}

@end
