//
//  BGRSATool.h
//  BGPay
//
//  Created by ldc on 2019/4/13.
//  Copyright © 2019 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGRSATool : NSObject

/// NOTE: return MD5 encoded string
+ (NSString *)md5WithStr:(NSString *)str;
/// NOTE: return sort string
+ (NSString *)getParam:(NSDictionary *)dict;

/// NOTE: return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
/// NOTE: return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
/// NOTE: return base64 encoded string
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
/// NOTE: return raw data
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

/// NOTE: decrypt base64 encoded string, convert result to string(not base64 encoded)
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end

NS_ASSUME_NONNULL_END
