# BGPay

[![CI Status](https://img.shields.io/travis/CoderLiXinLi/BGPay.svg?style=flat)](https://travis-ci.org/CoderLiXinLi/BGPay)
[![Version](https://img.shields.io/cocoapods/v/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)
[![License](https://img.shields.io/cocoapods/l/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)
[![Platform](https://img.shields.io/cocoapods/p/BGPay.svg?style=flat)](https://cocoapods.org/pods/BGPay)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

**返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|result  |String    |参数格式校验错误  |
|error  |BGPayError    |错误信息  |


```ruby
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
```
### 支付结果查询

**应用场景：** 

- 该接口提供所有BG支付订单的查询，商户可以通过该接口主动查询订单状态，完成下一步的业务逻辑。

**请求URL：** 
- ` http://www.bgex.top/v2/s/pay/getOrder`
-  example:http://www.bgex.top/v2/s/pay/getOrder?appId=123456789&mchId=123456789&outTradeNo=bg12689329

**请求方式：**
- POST 

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


|错误码|错误信息|解决方案|
|:-----  |:-----|-----                           |
|2065  |应用ID不能为空    |请输入正确的appId |
|2066  |商户号不能为空    |请输入正确的商户号 |
|2067  |商户订单号不能为空    |请输入正确的商户订单号  |
|2073  |预支付订单号不存在    |请输入正确的预支付订单号  |
|2077  |待支付    |待支付  |
|2078  |支付超时    |支付超时  |



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
**备注**
**错误码** 


|错误码|错误信息|解决方案|
|:-----  |:-----|-----                           |
|2065  |应用ID不能为空    |请输入正确的appId |
|2066  |商户号不能为空    |请输入正确的商户号 |
|2067  |商户订单号不能为空    |请输入正确的商户订单号  |
|3006  |提现记录不存在    |请查看生成提现记录接口  |
|3007  |提现记录审核失败    |等待平台审核提现记录  |
|3008  |提现记录审核失败    |提现记录审核失败  |




## Installation

BGPaySDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BGPay'
```

## Author

CoderLiXinLi, lixinli0327@gmail.com

## License

BGPaySDK is available under the MIT license. See the LICENSE file for more info.
