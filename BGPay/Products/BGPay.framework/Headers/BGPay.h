//
//  BGPay.h
//  BGPay_Example
//
//  Created by ldc on 2018/11/6.
//  Copyright © 2018 CoderLiXinLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGOrder.h"
#import "BGWithDraw.h"
#import "BGPayError.h"
#import "BGRSATool.h"

typedef void(^successBlock)(NSString *result);
typedef void(^failBlock)(NSString *result, BGPayError *error);

NS_ASSUME_NONNULL_BEGIN

@interface BGPay : NSObject

/**
 *  Debug
 */
+ (void)setDebug;
    
/**
 *  支付接口
 *
 *  @param order             订单模型
 *  @param formsScheme       调用支付的app注册在info.plist中的scheme
 *  @param successBlock      支付结果回调Block
 *  @param failBlock         支付结果回调Block
 */
+ (void)payOrder:(BGOrder *)order scheme: (NSString *)formsScheme success: (successBlock)successBlock failed: (failBlock)failBlock;

/**
 *  查询订单状态接口
 *
 *  @param appId             应用ID
 *  @param mchId             商户号
 *  @param outTradeNo        商户订单号
 *  @param successBlock      支付结果回调Block
 *  @param failBlock         支付结果回调Block
 */
+ (void)getPayOrderWithAppId:(NSString *)appId andMchId:(NSString *)mchId andOutTradeNo:(NSString *)outTradeNo success: (successBlock)successBlock failed: (failBlock)failBlock;
    
@end

NS_ASSUME_NONNULL_END
