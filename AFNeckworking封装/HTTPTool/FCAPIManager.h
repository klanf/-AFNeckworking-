//
//  FCAPIManager.h
//  FogCerebellum
//
//  Created by jaime on 2019/6/17.
//  Copyright © 2019 qinghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCHttpTool.h"

typedef NS_ENUM(NSUInteger, APIManager) {
    
    //用来回调时传递参数API
    APIPostExample = 0,
            //...
};

@protocol ApiManagerDelegate <NSObject>

@required
//回调返回成功的response
- (void)apiManagerDidSuccess:(APIManager)apiManager response:(id _Nullable )response;
//回调返回错误信息
- (void)apiManagerDidFailure:(NSError *_Nullable)error;

@end
NS_ASSUME_NONNULL_BEGIN

@interface FCAPIManager : NSObject

@property (nonatomic,weak) id<ApiManagerDelegate>delegate;

+ (FCAPIManager *)sharedManager;

#pragma mark - 待调用的api
//在这里写好调用api的方法，在Controller中调用即可
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
