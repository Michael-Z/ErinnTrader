
#import <UIKit/UIKit.h>

@interface HouseShopViewController : TTTableViewController <UISearchBarDelegate> {
 @private
  UISearchBar *_searchBar;
}
@property (nonatomic, retain) UISearchBar *searchBar;
@end
