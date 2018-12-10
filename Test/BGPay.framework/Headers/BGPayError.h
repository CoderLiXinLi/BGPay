//
//  BGPayError.h
//  BGPay_Example
//
//  Created by ldc on 2018/11/6.
//  Copyright © 2018 CoderLiXinLi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    /// NOTE:未知错误
    BGErrUnknownError         = 1000,
    /// NOTE:未安装BG客户端
    BGErrBgNotInstalled       = 1001,
    
    /// NOTE:用户账号被禁用    请联系客服
    BGErrDisableAccount       = 2011,
    /// NOTE:资金密码错误    请输入正确的支付密码
    BGErrPasswordError        = 2012,
    
    /// NOTE:用户不存在    用户未注册
    BGErrNonExistUser         = 2018,
    
    /// NOTE:应用ID不能为空    请输入正确的appId
    BGErrInvalidAppId         = 2065,
    /// NOTE:商户号不能为空    请输入正确的商户号
    BGErrInvalidMchId         = 2066,
    /// NOTE:商户订单号不能为空    请输入正确的商户订单号
    BGErrInvalidOutTradeNo    = 2067,
    /// NOTE:平台未注册    请商户前往申请此接口权限
    BGErrInvalidAccount       = 2068,
    /// NOTE:商户号不匹配    请商户查看商户号是否正确
    BGErrUnknownMchId         = 2069,
    /// NOTE:平台已禁用    请商户前往申请接触禁用
    BGErrDisableMch           = 2070,
    /// NOTE:预支付订单号不存在    请输入正确的预支付订单号
    BGErrUnknownPrepayId      = 2073,
    /// NOTE:待支付    待支付
    BGErrUnPay                = 2077,
    /// NOTE:支付超时    支付超时
    BGErrPayTimeOut           = 2078,
    /// NOTE:已支付完成    订单支付已完成
    BGErrPaid                 = 2079,
    /// NOTE:签名错误    请检查生成的签名
    BGErrUnknownSign          = 2080,
    
    /// NOTE:提现记录审核存在    提现记录已存在请联系客服审核
    BGErrWithdrawRecord       = 3001,
    /// NOTE:提现金额需要大于0    提现金额需要大于0
    BGErrUnknownFee           = 3002,
    /// NOTE:appId匹配错误    请检查appId
    BGErrUnknownAppId         = 3003,
    /// NOTE:商户号匹配错误    请检查商户号
    BGErrUnknownMchId2        = 3004,
    /// NOTE:商户已经禁用提现    商户已经禁用提现
    BGErrDisableWithdraw      = 3005,
    /// NOTE:提现记录不存在    请查看生成提现记录接口
    BGErrNoWithdrawRecord     = 3006,
    /// NOTE:提现记录审核失败    等待平台审核提现记录
    BGErrWithdrawRecordFailed = 3007,
    /// NOTE:提现记录审核失败    提现记录审核失败
    BGErrWithdrawFailed       = 3008,
    /// NOTE: 资金不足    请充值
    BGErrNoMoney              = 50027,
    /// NOTE:用户尚未完成高级实名认证    请用户完成实名认证
    BGErrNotAuthUser          = 2000000
    
} BGErrCode;

NS_ASSUME_NONNULL_BEGIN

@interface BGPayError : NSObject
/// NOTE:错误码
@property(nonatomic,assign) BGErrCode errorCode;
/// NOTE:错误信息
@property(nonatomic,copy) NSString *errorMessage;
    
-(BGErrCode)getError:(NSInteger)code;
    
@end

NS_ASSUME_NONNULL_END
