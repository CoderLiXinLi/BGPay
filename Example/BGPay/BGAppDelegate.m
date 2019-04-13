//
//  BGAppDelegate.m
//  BGPay
//
//  Created by CoderLiXinLi on 11/06/2018.
//  Copyright (c) 2018 CoderLiXinLi. All rights reserved.
//

#import "BGAppDelegate.h"
#import <BGPay/BGPay.h>

@implementation BGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    if ([url.host isEqualToString:@"BigoClient"]) {
        //TODO:此处处理回调结果
        NSLog(@"此处处理回调结果");
        NSString *appId = @"1084695898372562946";
        NSString *mchId = @"980822476815695873";
        NSString *outTradeNo = @"bg201812031530292177781207020";
        
        [BGPay getPayOrderWithAppId:appId andMchId:mchId andOutTradeNo:outTradeNo success:^(NSString *result) {
            NSLog(@"%@",result);
        } failed:^(NSString *result, BGPayError *error) {
            NSLog(@"%ld", (long)error.errorCode);
            NSLog(@"%@",error.errorMessage);
        }];
    }
    
    return YES;
}

@end
