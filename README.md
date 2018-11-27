# BGPay

[![CI Status](https://img.shields.io/travis/CoderLiXinLi/BGPay.svg?style=flat)](https://travis-ci.org/CoderLiXinLi/BGPay)
[![Version](https://img.shields.io/cocoapods/v/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)
[![License](https://img.shields.io/cocoapods/l/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)
[![Platform](https://img.shields.io/cocoapods/p/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation
### Installation with CocoaPods
BGPaySDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BGPay'
```
### Manually
下载依赖库[地址](https://github.com/CoderLiXinLi/BGPay/tree/master/Lib "依赖库地址").
```ruby
需要添加下面两个依赖库到 Embedded Binaries
```
**依赖framework：**
- AFNetworking.framework
- BGPay.framework

### 配置
#### 生命周期
```ruby
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    if ([url.host isEqualToString:@"BigoClient"]) {
        //TODO:此处处理回调结果
        NSLog(@"此处处理回调结果");
    }

return YES;
}
```
#### URL Schemes
```ruby
URL Schemes "创建APP Scheme"
LSApplicationQueriesSchemes 白名单 添加 "BigoClient"
```

#### 签名规则
点击这里查看 [Sign文档](http://showdoc.bg.ink/web/#/14?page_id=19). 

### 统一下单

**应用场景：** 
- 商户系统先调用该接口在BGSDK生成预支付交易单，成功之后调起BG客户端,并可以在线支付,失败后返回对应的错误信息。

**方法：**
+ (void)payOrder:(BGOrder *)order scheme: (NSString *)formsScheme success: (successBlock)successBlock failed: (failBlock)failBlock;

**参数：** 
#### order
|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string |应用ID   |
|mchId |是  |string | 商户号    |
|nonceStr        |是  |string | 随机字符串    |
|outTradeNo        |是  |string | 商户订单号    |
|totalFee        |是  |string | 总金额    |
|notifyUrl       |否  |string | 通知地址    |
|sign       |是  |string | 签名信息    |

#### scheme
|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|formsScheme |是  |string |应用Scheme   |

**返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|result  |String    |参数格式校验错误  |
|error  |BGPayError    |错误信息  |


```ruby
NSString *appId = @"1056362713403392003";
NSString *mchId = @"1039540523250823273";
NSString *nonceStr = @"123456789";
NSString *outTradeNo = @"bgTest123456789";
NSString *totalFee = @"10";
NSString *notifyUrl = @"http://192.168.1.108:7076/pay/getOrder";
/// 签名信息
NSString *sign = @"C0B7FD10085EBCD065957B72E68CA1E6";

BGOrder *order = [BGOrder orderWithAppId:appId andMchId:mchId andNonceStr:nonceStr andOutTradeNo:outTradeNo andTotalFee:totalFee andSign:sign andNotifyUrl:notifyUrl];

[BGPay payOrder:order scheme:@"OtherApp" success:^(NSString *result) {
    NSLog(@"%@",result);
} failed:^(NSString *result, BGPayError *error) {
    NSLog(@"%ld", (long)error.errorCode);
    NSLog(@"%@",error.errorMessage);
}];
```
### 提现

**应用场景：** 
- 商户系统调用该接口在BG服务后台进行货币提现操作。

**方法：**
+ (void)withDraw:(BGWithDraw *)withDraw success: (successBlock)successBlock failed: (failBlock)failBlock;

**参数：** 
#### withDraw
|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string |应用ID   |
|mchId |是  |string | 商户号    |
|nonceStr        |是  |string | 随机字符串    |
|outTradeNo        |是  |string | 商户订单号    |
|phone       |是  |string | 手机号    |
|countryCode       |是  |string | 国际电话区号    |
|totalFee        |是  |string | 总金额    |
|sign       |是  |string | 签名信息    |

**返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|result  |String    |参数格式校验错误  |
|error  |BGPayError    |错误信息  |


```ruby
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
```
### 支付结果查询

**应用场景：** 

- 该接口提供所有BG支付订单的查询，商户可以通过该接口主动查询订单状态，完成下一步的业务逻辑。

**请求URL：** 
- ` http://www.bgex.top/v2/s/pay/getOrder`
-  example:http://www.bgex.top/v2/s/pay/getOrder?appId=123456789&mchId=123456789&outTradeNo=bg12689329

**请求方式：**
- GET 

**请求数据格式：**
- JSON 



**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string |应用ID   |
|mchId |是  |string | 商户号    |
|outTradeNo       |是  |string | 商户订单号    |






**返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|return_code  |String    |此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断  |
|return_msg  |String    |参数格式校验错误  |
**备注**
**错误码** 

### 提现结果查询

**应用场景：** 

- 该接口提供第三方BG提现的结果查询，商户可以通过该接口主动查询提现状态，完成下一步的业务逻辑。

**请求URL：** 
- ` http://www.bgex.top/v2/s/gameWithdrawOrder/getWithdraw`
-  example:http://www.bgex.top/v2/s/gameWithdrawOrder/getWithdraw?appId=123456789&mchId=123456789&outTradeNo=bg12689329

**请求方式：**
- GET 

**请求数据格式：**
- JSON 



**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string |应用ID   |
|mchId |是  |string | 商户号    |
|outTradeNo       |是  |string | 商户提现订单号    |

**返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|return_code  |String    |此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断  |
|return_msg  |String    |参数格式校验错误  |

## Author

CoderLiXinLi, lixinli0327@gmail.com

## License

BGPaySDK is available under the MIT license. See the LICENSE file for more info.


## 错误码
|错误码|枚举|错误信息|解决方案|
|:-----  |:-----|:-----|-----                           |
|1000  |BGErrUnknownError|未知错误    |未知错误  |
|1001  |BGErrBgNotInstalled|未安装BG客户端    |未安装BG客户端  |
|2011  |BGErrDisableAccount|用户账号被禁用    |请联系客服  |
|2012  |BGErrPasswordError|资金密码错误    |请输入正确的支付密码  |
|2018  |BGErrNonExistUser|用户不存在    |用户未注册 |
|2065  |BGErrInvalidAppId|应用ID不能为空    |请输入正确的appId |
|2066  |BGErrInvalidMchId|商户号不能为空    |请输入正确的商户号 |
|2067  |BGErrInvalidOutTradeNo|商户订单号不能为空    |请输入正确的商户订单号  |
|2068  |BGErrInvalidAccount|平台未注册    |请商户前往申请此接口权限 |
|2069  |BGErrUnknownMchId|商户号不匹配    |请商户查看商户号是否正确  |
|2070  |BGErrDisableMch|平台已禁用    |请商户前往申请接触禁用  |
|2073  |BGErrUnknownPrepayId|预支付订单号不存在    |请检查预支付订单号 |
|2077  |BGErrUnPay|待支付    |待支付  |
|2078  |BGErrPayTimeOut|支付超时    |订单支付超时  |
|2079  |BGErrPaid|已支付完成    |订单支付已完成  |
|2080  |BGErrUnknownSign|签名错误    |请检查生成的签名  |
|3001  |BGErrWithdrawRecord|提现记录审核存在    |提现记录已存在请联系客服审核  |
|3002  |BGErrUnknownFee|提现金额需要大于0    |提现金额需要大于0  |
|3003  |BGErrUnknownAppId|appId匹配错误    |请检查appId  |
|3004  |BGErrUnknownMchId2|商户号匹配错误    |请检查商户号 |
|3005  |BGErrDisableWithdraw|商户已经禁用提现    |商户已经禁用提现 |
|3006  |BGErrNoWithdrawRecord|提现记录不存在    |请查看生成提现记录接口  |
|3007  |BGErrWithdrawRecordFailed|提现记录审核失败    |等待平台审核提现记录  |
|3008  |BGErrWithdrawFailed|提现记录审核失败    |提现记录审核失败  |
|50027  |BGErrNoMoney|资金不足    |请充值  |
|2000000  |BGErrNotAuthUser|用户尚未完成高级实名认证    |请用户完成实名认证  |
