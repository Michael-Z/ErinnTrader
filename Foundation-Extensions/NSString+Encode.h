
#import <Foundation/Foundation.h>

@interface NSString (encode)
- (NSString *)encodeString:(NSStringEncoding)encoding;
- (NSString *)decodeString:(NSStringEncoding)encoding;
@end
