
#import <Foundation/Foundation.h>
#import "BoardItem.h"

@interface BoardItemViewDataSource : TTListDataSource {
 @private
  BoardItem *_boardItem;
}
@property (nonatomic, retain) BoardItem *boardItem;
- (id)initWithBoardItem:(BoardItem *)boardItem;
@end
