//
//  FCHttpTool.h
//  FogCerebellum
//
//  Created by jaime on 2019/6/17.
//  Copyright © 2019 qinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, APIMethos) {
    
    APIMethosGET = 0,
    APIMethosPOST,
    APIMethosPUT,
    APIMethosDELETE
};
NS_ASSUME_NONNULL_BEGIN

@interface FCHttpTool : NSObject

//AFNetWorking
+ (void)requestMethos:(APIMethos)APIMethos
            URLString:(NSString *)URLString
           parameters:(id)parameters
              success:(void (^)(id response))success
              failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
