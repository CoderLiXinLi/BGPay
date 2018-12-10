//
//  NSString+BG_Extension.h
//  OCTest
//
//  Created by ldc on 2018/12/10.
//  Copyright © 2018 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BG_Extension)
- (NSString *)md5;
+ (NSString *)getSign:(NSDictionary *)dict key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
