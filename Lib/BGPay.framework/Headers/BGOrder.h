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
/// NOTE:总金额
@property(nonatomic,copy) NSString *cipherText;
    
+ (instancetype)orderWithAppId:(NSString *)appId andMchId:(NSString *)mchId andCipherText:(NSString *)cipherText;
    
@end

NS_ASSUME_NONNULL_END
