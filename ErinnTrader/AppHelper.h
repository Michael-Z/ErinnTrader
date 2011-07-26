
#import <Foundation/Foundation.h>
#import "NSDate-Utilities.h"

@interface AppHelper : NSObject {
}
+ (NSString *)fuzzyTime:(NSDate *)datetime;
+ (NSString *)fuzzyTimeFromString:(NSString *)datetime;
@end
