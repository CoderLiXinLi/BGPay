//
//  NSString+Formmate.h
//  YiPeiLianMeng
//
//  Created by dt on 16/5/18.
//  Copyright © 2016年 dt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Formmate)
- (NSString *)md5;
+ (NSString *)getSign:(NSDictionary *)dict key:(NSString *)key;
@end
