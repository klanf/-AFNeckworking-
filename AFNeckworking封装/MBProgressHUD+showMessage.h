//
//  MBProgressHUD+showMessage.h
//  AGV
//
//  Created by jaime on 2019/4/29.
//  Copyright © 2019 qinghua.ios. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (showMessage)

+ (void)showLoadingView;
+ (void)removeLoadingView;

+ (void)showHubText:(NSString *)text completed:(void (^ __nullable)(void))completioned;
+ (void)showHubText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
