//
//  WGBaseViewController.h
//  自定义小控件
//
//  Created by dfhb@rdd on 16/11/24.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGBaseViewController : UIViewController
/** 隐藏StatusBar */
@property (nonatomic, assign) BOOL hiddenStatusBar;
/** StatusBar风格 */
@property (nonatomic, assign) UIStatusBarStyle barStyle;

@end

@interface WGBaseViewController (NavigationController)
- (void)wg_pushVC:(UIViewController *)viewController;
- (void)wg_pop;
- (void)wg_popToVC:(UIViewController *)viewController;
- (void)wg_popToRootVC;
@end
@interface WGBaseViewController (ModelViewController)
- (void)wg_presentVC:(UIViewController *)viewController;
- (void)wg_presentVC:(UIViewController *)viewController completion:(void(^)(void))completion;
- (void)wg_dismiss;
- (void)wg_dismissWithCompletion:(void(^)(void))completion;
@end
@interface WGBaseViewController (ChildViewController)
- (void)wg_addChildVC:(UIViewController *)viewController;
- (void)wg_removeChildVC:(UIViewController *)viewController;
@end

@interface WGBaseViewController (CheckNetwork)
/** 检测网络是否可用 */
@property (nonatomic, assign, readonly) BOOL isNetworkReachable;
/** 请求数据（交给子类去实现） */
- (void)wg_loadData;
@end