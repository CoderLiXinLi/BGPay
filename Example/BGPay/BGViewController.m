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

typedef enum : NSInteger {
    /// NOTE:未知错误
    TEST1Error         = 1000,
    /// NOTE:未安装BG客户端
    TEST2Error       = 1001,
    
} TESTErrCode;

@interface TestPayError : NSObject
/// NOTE:错误码
@property(nonatomic,assign) TESTErrCode errorCode;
/// NOTE:错误信息
@property(nonatomic,copy) NSString *errorMessage;

@end

@implementation TestPayError

- (NSString *)description
{
    return [NSString stringWithFormat:@"errorCode:%ld,errorMessage:%@",(long)_errorCode,_errorMessage];
}

@end


@interface BGViewController ()

@end

@implementation BGViewController

- (IBAction)orderClick:(UIButton *)sender
{
    NSString *appId = @"1056362713403392003";
    NSString *mchId = @"1039540523250823273";
    NSString *nonceStr = @"123456789";
    NSString *outTradeNo = @"bgTest123456789";
    NSString *totalFee = @"10";
    NSString *notifyUrl = @"http://47.75.112.14:7076/pay/getOrder";
    /// 签名信息
    NSString *sign = @"C0B7FD10085EBCD065957B72E68CA1E6";
    
    BGOrder *order = [BGOrder orderWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andTotalFee:totalFee andSign:sign andNotifyUrl:notifyUrl];
    
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
