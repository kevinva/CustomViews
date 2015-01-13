//
//  YippyHubHelper.h
//  Fenba
//
//  Created by kevin on 14-8-6.
//  Copyright (c) 2014年 何峙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YippyHubHelper : NSObject

/**
 *  @brief  可以操作Hub覆盖的界面
 */
+ (void)showToastForUserinteractionDisableWithMessage:(NSString *)message inView:(UIView *)view;

/**
 *  @brief  不可以操作Hub覆盖的界面
 */
+ (void)showToastWithMessage:(NSString *)message inView:(UIView *)view;

/**
 *  @brief  不可以操作Hub覆盖的界面
 */
+ (void)showWaitingViewInView:(UIView *)view;

/**
 *  @brief  可以操作Hub覆盖的界面
 */
+ (void)showWaitingViewInViewForCancelable:(UIView *)view;

/**
 *  @brief  手动取消等待层
 */
+ (void)cancelWaitingView;

@end
