
#import <UIKit/UIKit.h>

@interface BoardSearchResultViewController : TTTableViewController {
 @private
  NSString *_searchQuery;
}
@property (nonatomic, copy) NSString *searchQuery;
@end
