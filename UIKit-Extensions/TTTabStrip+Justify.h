
#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "Three20UI/TTTabStrip.h"
#import "Three20UI/TTTab.h"
#import "Three20UI/UIViewAdditions.h"
#import "Three20UI/private/TTTabBarInternal.h"
#import "Three20Style/TTGlobalStyle.h"
#import "Three20Style/TTStyleSheet.h"
#import "Three20Core/TTCorePreprocessorMacros.h"

@interface TTTabStrip (JustifiedBarCategory)
- (CGSize)layoutTabs;
@end
