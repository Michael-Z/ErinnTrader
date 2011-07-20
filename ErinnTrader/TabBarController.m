
#import "TabBarController.h"

@implementation TabBarController

- (void)viewDidLoad {
  [self setTabURLs:[NSArray arrayWithObjects:
                    @"tt://board",
                    @"tt://houseShop",
                    @"tt://settings",
                    @"tt://credit",
                    nil]];
}  

@end
