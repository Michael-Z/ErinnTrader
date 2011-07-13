
#import <Foundation/Foundation.h>
#import "BoardModel.h"

@interface BoardViewDataSource : TTListDataSource {
 @private  
  BoardModel *_boardModel;
}
@property (nonatomic, retain) BoardModel *boardModel;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
