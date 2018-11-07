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
 *  提现接口
 *
 *  @param withDraw           订单模型
 *  @param successBlock       支付结果回调Block
 *  @param failBlock          支付结果回调Block
 */
+ (void)withDraw:(BGWithDraw *)withDraw success: (successBlock)successBlock failed: (failBlock)failBlock;
    
@end

NS_ASSUME_NONNULL_END
