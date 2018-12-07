//
//  NSString+Formmate.m
//  YiPeiLianMeng
//
//  Created by dt on 16/5/18.
//  Copyright © 2016年 dt. All rights reserved.
//

#import "NSString+Formmate.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Formmate)

- (NSString *)md5
{
    // Code adapted from
    // http://amcmillan.livejournal.com/155200.html
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+ (NSString *)getSign:(NSDictionary *)dict key:(NSString *)key {
    
    NSArray *kArrSort = [dict allKeys];
    NSArray *resultkArrSort = [kArrSort sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    __block NSMutableString *sign = [NSMutableString string];
    [resultkArrSort enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *value = dict[obj];
        NSMutableString *temp = [NSMutableString string];
        [temp appendString:obj];
        [temp appendString:@"="];
        [temp appendString:value];
        [temp appendString:@"&"];
        [sign appendString:temp];
    }];
    
    NSString *keyStr = [NSString stringWithFormat:@"key=%@",key];
    [sign appendString:keyStr];
    
    return [[sign md5] uppercaseString];
}

@end
