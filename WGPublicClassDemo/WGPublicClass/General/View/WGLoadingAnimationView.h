//
//  WGLoadingAnimationView.h
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/11/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//  正在加载页面

#import <UIKit/UIKit.h>

@interface WGLoadingAnimationView : UIView
/** 动画image数组 (可以在子类中重写) */
- (NSArray <UIImage *>*)animationImageArray;
/** 显示 */
- (void)showInView:(UIView *)view;
/** 销毁 */
- (void)dismiss;

@end
