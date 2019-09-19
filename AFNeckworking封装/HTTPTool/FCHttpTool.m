//
//  FCHttpTool.m
//  FogCerebellum
//
//  Created by jaime on 2019/6/17.
//  Copyright © 2019 qinghua. All rights reserved.
//

#import "FCHttpTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation FCHttpTool

+ (void)requestMethos:(APIMethos)APIMethos
     URLString:(NSString *)URLString
    parameters:(id)parameters
       success:(void (^)(id response))success
       failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //申明请求的数据是http类型
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求头
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //修改请求类型参数设置(去掉DELETE方法)
//    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];//add by zhishi 2019/07/27
    //设置SSL验证
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [securityPolicy setValidatesDomainName:NO];
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    
    void(^successBlock)(NSURLSessionDataTask * _Nonnull, id  _Nullable) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    };
    
    void(^failureBlock)(NSURLSessionDataTask * _Nullable , NSError * _Nonnull) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    };
    
    void(^progressBlock)(NSProgress * _Nonnull) = ^(NSProgress * _Nonnull downloadProgress) {
    };
    
    switch (APIMethos) {
            
        case APIMethosGET:
            [manager GET:URLString parameters:parameters progress:progressBlock success:successBlock failure:failureBlock];
            break;
        case APIMethosPOST:
            [manager POST:URLString parameters:parameters progress:progressBlock success:successBlock failure:failureBlock];
            break;
        case APIMethosPUT:
            [manager PUT:URLString parameters:parameters success:successBlock failure:failureBlock];
            break;
        case APIMethosDELETE:
            [manager DELETE:URLString parameters:parameters success:successBlock failure:failureBlock];
            break;
    }
}


@end
