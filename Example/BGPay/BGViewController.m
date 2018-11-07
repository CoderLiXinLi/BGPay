//
//  BGViewController.m
//  BGPay
//
//  Created by CoderLiXinLi on 11/06/2018.
//  Copyright (c) 2018 CoderLiXinLi. All rights reserved.
//

#import "BGViewController.h"
#import "BGPay.h"

@interface BGViewController ()

@end

@implementation BGViewController

- (IBAction)orderClick:(UIButton *)sender
{
    NSString *appId = @"123456789";
    NSString *mchId = @"123456789";
    NSString *nonceStr = @"58685768576309403";
    NSString *outTradeNo = @"bg11111111";
    NSString *totalFee = @"2.456";
    NSString *notifyUrl = @"www.baidu.com";
    
    BGOrder *order = [BGOrder orderWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andTotalFee:totalFee andNotifyUrl:notifyUrl];
    
    [BGPay payOrder:order scheme:@"OtherApp" success:^(NSString *result) {
        NSLog(@"%@",result);
    } failed:^(NSString *result, BGPayError *error) {
        NSLog(@"%@", error.errorMessage);
    }];
}

- (IBAction)withDrawClick:(UIButton *)sender
{
    NSString *appId = @"123456789";
    NSString *mchId = @"123456789";
    NSString *nonceStr = @"58685768576309403";
    NSString *outTradeNo = @"bg11111111";
    NSString *phone = @"13315999725";
    NSString *countryCode = @"+86";
    NSString *totalFee = @"2.3456";
    
    BGWithDraw *withDraw = [BGWithDraw withDrawWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andPhone:phone andCountryCode:countryCode andTotalFee:totalFee];
    
    [BGPay withDraw:withDraw success:^(NSString *result) {
        NSLog(@"%@",result);
    } failed:^(NSString *result, BGPayError *error) {
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
