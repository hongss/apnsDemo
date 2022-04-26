
#import <Foundation/Foundation.h>

@interface MathUtil : NSObject

+ (NSString *)md5:(NSString *)input;
+ (NSString *)md5ByFile:(NSString *)filepath;
+ (NSString *) encodeDES:(NSString *)plainText key:(NSString *)key nopadding:(BOOL)bNoPadding;
+ (NSString *) decodeDES:(NSString*)cipherText key:(NSString*)key;
+ (NSString *) decodeDESHex:(NSString*)cipherText key:(NSString*)key nopadding:(BOOL)bNoPadding;
@end
