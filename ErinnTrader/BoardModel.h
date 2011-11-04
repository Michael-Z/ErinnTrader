
#import <Foundation/Foundation.h>

@interface BoardModel : TTURLRequestModel {
 @private 
  NSMutableArray *_boardItems;
  NSString *_searchQuery;
  NSInteger _page;
  BOOL _finished;
}
@property (nonatomic, retain) NSMutableArray *boardItems;
@property (nonatomic, copy) NSString *searchQuery;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL finished;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
