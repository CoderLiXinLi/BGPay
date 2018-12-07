//
//  BGViewController.m
//  BGPay
//
//  Created by CoderLiXinLi on 11/06/2018.
//  Copyright (c) 2018 CoderLiXinLi. All rights reserved.
//

#import "BGViewController.h"
//#import "BGPay.h"
#import <BGPay/BGPay.h>
#import "NSString+Formmate.h"

@interface BGViewController ()

@end

@implementation BGViewController

- (IBAction)orderClick:(UIButton *)sender
{
    NSString *appId = @"1056362713403392002";
    NSString *mchId = @"123456789";
    NSString *nonceStr = @"1234567890";
    NSString *outTradeNo = @"201812031530292177781207011";
    NSString *totalFee = @"10";
    NSString *notifyUrl = @"http://47.75.112.14:7076/pay/getOrder";
    
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:appId, @"appId",mchId, @"mchId",nonceStr, @"nonceStr",outTradeNo, @"outTradeNo",totalFee, @"totalFee",notifyUrl, @"notifyUrl", nil];

    /// 签名信息
    NSString *key = @"xxxx";
    NSString *sign = [NSString getSign:param key:key];
    NSLog(@"%@",sign);
    
    BGOrder *order = [BGOrder orderWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andTotalFee:totalFee andSign:sign andNotifyUrl:@""];
    
    [BGPay payOrder:order scheme:@"OtherApp" success:^(NSString *result) {
        NSLog(@"%@",result);
    } failed:^(NSString *result, BGPayError *error) {
        NSLog(@"%ld", (long)error.errorCode);
        NSLog(@"%@",error.errorMessage);
    }];
}

- (IBAction)withDrawClick:(UIButton *)sender
{
    NSString *appId = @"1056362713403392003";
    NSString *mchId = @"1039540523250823273";
    NSString *nonceStr = @"1234567890";
    NSString *outTradeNo = @"bgW123456789";
    NSString *totalFee = @"1.23";
    NSString *phone = @"18730160317";
    NSString *countryCode = @"+86";
    /// 签名信息
    NSString *sign = @"EF94B11B03D55D6AC916FCF3C5356E74";
    
    BGWithDraw *withDraw = [BGWithDraw withDrawWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andPhone:phone andCountryCode:countryCode andTotalFee:totalFee andSign:sign];
    
    [BGPay withDraw:withDraw success:^(NSString *result) {
        NSLog(@"%@",result);
    } failed:^(NSString *result, BGPayError *error) {
        NSLog(@"%ld", (long)error.errorCode);
        NSLog(@"%@",error.errorMessage);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"BGSDK";
    [BGPay setDebug];
}

@end
