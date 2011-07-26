
#import <Foundation/Foundation.h>
#import "BoardModel.h"

@interface BoardViewDataSource : TTListDataSource {
 @private  
  BoardModel *_boardModel;
  TradeType tradeType;
}
@property (nonatomic, retain) BoardModel *boardModel;
@property (nonatomic, assign) TradeType tradeType;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
