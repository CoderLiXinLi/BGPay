//
//  BGOrder.h
//  BGPay_Example
//
//  Created by ldc on 2018/11/6.
//  Copyright © 2018 CoderLiXinLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGOrder : NSObject
 /// NOTE:应用ID
@property(nonatomic,copy) NSString *appId;
 /// NOTE:商户号
@property(nonatomic,copy) NSString *mchId;
/// NOTE:随机字符串
@property(nonatomic,copy) NSString *nonceStr;
/// NOTE:商户订单号
@property(nonatomic,copy) NSString *outTradeNo;
/// NOTE:总金额
@property(nonatomic,copy) NSString *totalFee;
/// NOTE:通知地址
@property(nonatomic,copy) NSString *notifyUrl;
    
+ (instancetype)orderWithAppId:(NSString *)appId andMchId:(NSString *)mchId andNonceStr:(NSString *)nonceStr andOutTradeNo:(NSString *)outTradeNo andTotalFee:(NSString *)totalFee andNotifyUrl:(NSString *)notifyUrl;
    
@end

NS_ASSUME_NONNULL_END
