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

@interface BGViewController ()

@end

@implementation BGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"BGSDK";
    ///NOTE: Debug
    [BGPay setDebug];
}

- (IBAction)orderClick:(UIButton *)sender
{
    NSString *pubkey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDsRajSERYUXn/t5N2ZB/5kH4Duu0aG9kigYIW76nGauOGytwJ5IWG2uV9+52Lj8YZtKNPMMF6je3acA4Q4waT57owKqb4Q0s7AvsACEG6VzqpUhgD66xbrbnejnGwvL1dxU3p4ZXOhh+sws6weoUKqjDRWT574fWHMvZkWZjsAhwIDAQAB";
    
    NSString *appId = @"1084695898372562946";
    NSString *mchId = @"980822476815695873";
    NSString *nonceStr = @"1234567890";
    NSString *outTradeNo = @"bg201812031530292177781207020";
    NSString *totalFee = @"10";
    NSString *notifyUrl = @"http://47.75.112.14:7076/pay/getOrder";
    
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:appId, @"appId",mchId, @"mchId",nonceStr, @"nonceStr",outTradeNo, @"outTradeNo",totalFee, @"totalFee",notifyUrl, @"notifyUrl", nil];
    
    /// 签名信息
    NSString *key = @"LKMHSF8WGC4FW";
    NSString *parmStr = [BGRSATool getParam:param];
    NSString *keySign = [NSString stringWithFormat:@"%@key=%@",parmStr,key];
    NSString *signMd5 = [[BGRSATool md5WithStr:keySign] uppercaseString];
    NSString *sign = [NSString stringWithFormat:@"%@sign=%@",parmStr,signMd5];

    /// 得到公钥密文
    NSString *cipherText = [BGRSATool encryptString:sign publicKey:pubkey];
    
    BGOrder *order = [BGOrder orderWithAppId:appId andMchId:mchId andCipherText:cipherText];
    
    [BGPay payOrder:order scheme:@"OtherApp" success:^(NSString *result) {
        NSLog(@"%@",result);
    } failed:^(NSString *result, BGPayError *error) {
        NSLog(@"%ld", (long)error.errorCode);
        NSLog(@"%@",error.errorMessage);
    }];
}

@end
