# AFNeckworking 封装
简单封装AFNeckworking框架

## 一、FCHttpTool 
1. 定义枚举常量，申明要调用的Http方法
```
typedef NS_ENUM(NSUInteger, APIMethos) {
    
    APIMethosGET = 0,
    APIMethosPOST,
    APIMethosPUT,
    APIMethosDELETE
};
```
2. 初始化 AFNeckworking ，调用传入的参数进行 http 请求，并使用Block将结果回调
```
APIMethos：枚举常量，申明调用的 http 请求方法

URLString：请求地址

parameters：请求参数

success：请求成功回调

failure：请求失败回调

+ (void)requestMethos:(APIMethos)APIMethos
            URLString:(NSString *)URLString
           parameters:(id)parameters
              success:(void (^)(id response))success
              failure:(void (^)(NSError *error))failure;
```

## 二、 FCAPIManager 
1. 创建单例

2. 定义枚举常量
```
typedef NS_ENUM(NSUInteger, APIManager) {
    
    //用来与相应接口方法绑定，辨认调用的API
    APIPostExample = 0,
    ...
};
```

3. 请求API的方法
```
- (void)callApiWithApiManager:(APIManager)apiManager apiMethos:(APIMethos)methos parameters:(NSDictionary *_Nullable)parameters UrlString:(NSString *)urlString;

```

4. 使用工厂模式生成请求接口的代码
```
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password {
    
    //需要请求的url
    NSString *urlString = @"https://www.zhihu.com";
    
    //需要请求的参数
    NSDictionary *parameters = @{@"userName":userName,@"password":password};
    
    //调用请求方法进行http请求
    [self callApiWithApiManager:APIPostExample
                      apiMethos:APIMethosPOST
                     parameters:parameters
                      UrlString:urlString];
}
```

5. 回调方法
```
@protocol ApiManagerDelegate <NSObject>

@required
//回调返回成功的response
- (void)apiManagerDidSuccess:(APIManager)apiManager response:(id _Nullable )response;
//回调返回错误信息
- (void)apiManagerDidFailure:(NSError *_Nullable)error;

@end
```
请求成功的结果会通过代理回调给请求者





