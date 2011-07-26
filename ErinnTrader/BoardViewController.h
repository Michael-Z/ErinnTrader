
#import <UIKit/UIKit.h>

@interface BoardViewController : TTTableViewController <TTTabDelegate, UISearchBarDelegate> {
 @private
  UISearchBar *_searchBar;
  TTTabBar *_tabBar;
}
@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) TTTabBar *tabBar;
@end
