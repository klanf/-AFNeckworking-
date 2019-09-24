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

2. 请求API的方法
```
- (void)callApiWithApiManager:(APIManager)apiManager apiMethos:(APIMethos)methos parameters:(NSDictionary *_Nullable)parameters UrlString:(NSString *)urlString;

```

3. 使用工厂模式生成请求接口的代码
```
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password {
    
    //需要
    请求的
    NSString *urlString = @"https://www.zhihu.com";
    
    NSDictionary *parameters = @{@"userName":userName,@"password":password};
    
    [self callApiWithApiManager:APIPostExample
                      apiMethos:APIMethosPOST
                     parameters:parameters
                      UrlString:urlString];
}
```








