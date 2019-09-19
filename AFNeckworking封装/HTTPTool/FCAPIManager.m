//
//  FCAPIManager.m
//  FogCerebellum
//
//  Created by jaime on 2019/6/17.
//  Copyright © 2019 qinghua. All rights reserved.
//

#import "FCAPIManager.h"
#import "MBProgressHUD+showMessage.h"

@interface FCAPIManager()

//@property FXAccount *account;

@end

@implementation FCAPIManager

+ (FCAPIManager *)sharedManager {
    
    static FCAPIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] initSharedManager];
    });
    
    return sharedManager;
}

- (instancetype)initSharedManager {
    
    self = [super init];
    if(self) {
        
        //用于初始化
    }
    
    return self;
}

//inlineblock

//请求API
- (void)callApiWithApiManager:(APIManager)apiManager apiMethos:(APIMethos)methos parameters:(NSDictionary *_Nullable)parameters UrlString:(NSString *)urlString {
    
    [MBProgressHUD showLoadingView];
    
    void(^success)(NSURLSessionDataTask *) = ^(NSURLSessionDataTask * response) {
        
        [MBProgressHUD removeLoadingView];
        if ([self.delegate respondsToSelector:@selector(apiManagerDidSuccess:response:)]) {
            [self.delegate apiManagerDidSuccess:apiManager response:response];
        }
    };
    
    void(^failure)(NSError *) = ^(NSError *error) {

        [MBProgressHUD removeLoadingView];
        
            if ([self.delegate respondsToSelector:@selector(apiManagerDidFailure:)]) {
            [self.delegate apiManagerDidFailure:error];
        }
    };
    
    [FCHttpTool requestMethos:methos URLString:urlString parameters:parameters success:success failure:failure];
}

#pragma mark - example
//在这里写好调用api的方法，在Controller中调用即可
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password {
    
    NSString *urlString = @"https://www.zhihu.com";
    
    NSDictionary *parameters = @{@"userName":userName,@"password":password};
    
    [self callApiWithApiManager:APIPostExample
                      apiMethos:APIMethosPOST
                     parameters:parameters
                      UrlString:urlString];
}

@end
