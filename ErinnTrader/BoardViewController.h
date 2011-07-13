
#import <UIKit/UIKit.h>

@interface BoardViewController : TTTableViewController <UISearchBarDelegate> {
 @private
  UISearchBar *_searchBar;
}
@property (nonatomic, retain) UISearchBar *searchBar;
@end
