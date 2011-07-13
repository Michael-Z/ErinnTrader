
#import <UIKit/UIKit.h>
#import "BoardItem.h"

@interface BoardItemViewController : TTViewController {
 @private
  BoardItem *_boardItem;
  UILabel *_titleLabel;
  UITextView *_detailText;
}
@property (nonatomic, assign) BoardItem *boardItem;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UITextView *detailText;
@end
