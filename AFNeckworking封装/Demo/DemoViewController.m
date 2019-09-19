//
//  DemoViewController.m
//  AFNeckworking封装
//
//  Created by jaime on 2019/9/19.
//  Copyright © 2019 qinghua.ios. All rights reserved.
//

#import "DemoViewController.h"
//引入头文件
#import "FCAPIManager.h"

@interface DemoViewController ()<ApiManagerDelegate>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置代理
    [[FCAPIManager sharedManager] setDelegate:self];
    //调用接口
    [[FCAPIManager sharedManager] loginWithUserName:@"" password:@""];
}

#pragma mark - Api Manager Delegate
//回调返回成功的response
- (void)apiManagerDidSuccess:(APIManager)apiManager response:(id _Nullable )response {
    
    if (apiManager == APIPostExample) {
        
        //do something
    }
}
//回调返回错误信息
- (void)apiManagerDidFailure:(NSError *_Nullable)error {
    //处理返回的错误信息
}

@end
