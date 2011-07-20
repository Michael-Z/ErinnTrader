
#import <UIKit/UIKit.h>

@interface BoardSearchResultViewController : TTTableViewController <TTTabDelegate> {
 @private
  NSString *_searchQuery;
  TTTabBar *_tabBar;
}
@property (nonatomic, copy) NSString *searchQuery;
@property (nonatomic, retain) TTTabBar *tabBar;
@end
