
#import <Foundation/Foundation.h>

@interface BoardItem : NSObject {
 @private
  NSInteger _id;
  NSString *_title;
  NSString *_author;
  NSString *_content;
  NSString *_url;
  NSTimeInterval _published;
}
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) NSTimeInterval published;
@end
