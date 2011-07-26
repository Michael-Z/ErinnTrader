
#import <UIKit/UIKit.h>

@interface HouseShopSearchResultViewController : TTTableViewController {
 @private
  NSString *_searchQuery;
}
@property (nonatomic, copy) NSString *searchQuery;
@end
