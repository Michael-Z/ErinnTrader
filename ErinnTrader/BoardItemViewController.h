
#import <UIKit/UIKit.h>
#import "BoardItem.h"

@interface BoardItemViewController : TTTableViewController {
 @private
  BoardItem *_boardItem;
}
@property (nonatomic, assign) BoardItem *boardItem;
@end
