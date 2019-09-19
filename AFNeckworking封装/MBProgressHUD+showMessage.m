//
//  MBProgressHUD+showMessage.m
//  AGV
//
//  Created by jaime on 2019/4/29.
//  Copyright © 2019 qinghua.ios. All rights reserved.
//

#import "MBProgressHUD+showMessage.h"

@implementation MBProgressHUD (showMessage)

+ (void)showLoadingView {
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = @"正在加载";
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)removeLoadingView {
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)showHubText:(NSString *)text {
    
    [self showHubText:text completed:nil];
}

+ (void)showHubText:(NSString *)text completed:(void (^ __nullable)(void))completed {
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0];
    
    hud.completionBlock = ^{
        if (completed) {
            completed();
        }
    };
}

@end
