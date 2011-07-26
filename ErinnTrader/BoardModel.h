
#import <Foundation/Foundation.h>

@interface BoardModel : TTURLRequestModel {
 @private 
  NSMutableArray *_boardItems;
  NSString *_searchQuery;
}
@property (nonatomic, retain) NSMutableArray *boardItems;
@property (nonatomic, copy) NSString *searchQuery;
- (id)initWithSearchQuery:(NSString *)searchQuery;
@end
