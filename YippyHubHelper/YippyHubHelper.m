//
//  YippyHubHelper.m
//  Fenba
//
//  Created by kevin on 14-8-6.
//  Copyright (c) 2014年 何峙. All rights reserved.
//

#import "YippyHubHelper.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YippyHubHelper ()

@property (nonatomic, strong) MBProgressHUD *HUD;

+ (YippyHubHelper *)sharedInstance;

@end

@implementation YippyHubHelper

#pragma mark - Private methods

+ (YippyHubHelper *)sharedInstance{
    static YippyHubHelper *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

#pragma mark - Public methods

+ (void)showToastWithMessage:(NSString *)message inView:(UIView *)view{
    if(!message || !view){
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.0f;
    hud.yOffset = 150.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

+ (void)showToastForUserinteractionDisableWithMessage:(NSString *)message inView:(UIView *)view{
    if(!message || !view){
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.0f;
    hud.yOffset = 150.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

+ (void)showWaitingViewInView:(UIView *)view{
    if(!view){
        return;
    }
    
    YippyHubHelper *helper = [YippyHubHelper sharedInstance];
    if(helper.HUD){
        return;
    }
    
    helper.HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:helper.HUD];
    
    [helper.HUD show:YES];
}

+ (void)showWaitingViewInViewForCancelable:(UIView *)view{
    if(!view){
        return;
    }
    
    YippyHubHelper *helper = [YippyHubHelper sharedInstance];
    if(helper.HUD){
        return;
    }
    
    helper.HUD = [[MBProgressHUD alloc] initWithView:view];
    helper.HUD.userInteractionEnabled = NO;
    [view addSubview:helper.HUD];
    
    [helper.HUD show:YES];
}

+ (void)cancelWaitingView{
    YippyHubHelper *helper = [YippyHubHelper sharedInstance];
    if(helper.HUD){
        [helper.HUD hide:YES];
        
        [helper.HUD removeFromSuperview];
        helper.HUD = nil;
    }
}

@end
