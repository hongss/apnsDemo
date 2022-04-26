#import "MathUtil.h"

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation MathUtil

+ (NSString *)md5:(NSString *)input
{
    const char *original_str = [input UTF8String];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), outputData);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [hash appendFormat:@"%02X", outputData[i]];
    }
    return [hash lowercaseString];
}

+ (NSString *)md5ByFile:(NSString *)filepath
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filepath];
    if (handle == nil) {
        return nil;
    }
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength:1024];
        CC_MD5_Update(&md5, [fileData bytes], (int)[fileData length]);
        if( [fileData length] == 0 )
            done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    [handle closeFile];
    NSMutableString* md5Hash = [NSMutableString string];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++){
        [md5Hash appendFormat:@"%02x",digest[i]];
    }
    
    return [md5Hash lowercaseString];
}




+ (NSString *) encodeDES:(NSString *)plainText key:(NSString *)key nopadding:(BOOL)bNoPadding
{
    NSString *ciphertext = nil;
    CCCryptorStatus cryptStatus;
    size_t numBytesEncrypted = 0;
    unsigned char buffer[1024];
    
    
    if(bNoPadding){
        const char *textBytes = [plainText UTF8String];
        NSUInteger dataLength = [plainText length];
        NSUInteger newSize=dataLength;
        
        int diff = (dataLength % kCCKeySizeDES);
        if(diff > 0) {
            newSize=dataLength+(kCCKeySizeDES-diff);
        }
        
        char dataPtr[newSize];
        memset(dataPtr,0,newSize);
        memcpy(dataPtr, textBytes, dataLength);
        
        memset(buffer, 0, sizeof(char));
        Byte iv[] = {1,2,3,4,5,6,7,8};
        
        cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          dataPtr, newSize,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    }else{
        const char *textBytes = [plainText UTF8String];
        NSUInteger dataLength = [plainText length];
        
        memset(buffer, 0, sizeof(char));
        Byte iv[] = {1,2,3,4,5,6,7,8};
        
        cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    }
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return ciphertext;
}
 
+ (NSString *) decodeDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [[NSData alloc] initWithBase64EncodedString:cipherText options:0];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    NSLog(@"hexdata: %@", hexData);
    return hexData;
}

+ (NSString *) decodeDESHex:(NSString*)cipherText key:(NSString*)key nopadding:(BOOL)bNoPadding
{
    CCCryptorStatus cryptStatus;
    NSData* cipherData = [self convertHexStrToData:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};

    if(bNoPadding){
        cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    }else{
        cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    }
     
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}


@end
