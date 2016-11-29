//
//  WGBaseViewController.m
//  自定义小控件
//
//  Created by dfhb@rdd on 16/11/24.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseViewController.h"

@implementation WGBaseViewController

- (void)setHiddenStatusBar:(BOOL)hiddenStatusBar {
    _hiddenStatusBar = hiddenStatusBar;
    [self setNeedsStatusBarAppearanceUpdate];
}
- (BOOL)prefersStatusBarHidden {
    return self.hiddenStatusBar;
}
- (void)setBarStyle:(UIStatusBarStyle)barStyle {
    _barStyle = barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.barStyle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - NavigationController
- (void)wg_pushVC:(UIViewController *)viewController {
    if (![viewController isKindOfClass:[UIViewController class]]) return;
    if (!self.navigationController) return;
    if (viewController.hidesBottomBarWhenPushed == NO) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)wg_pop {
    if (!self.navigationController) return;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)wg_popToVC:(UIViewController *)viewController {
    if (![viewController isKindOfClass:[UIViewController class]]) return;
    if (!self.navigationController) return;
    [self.navigationController popToViewController:viewController animated:YES];
}
- (void)wg_popToRootVC {
    if (!self.navigationController) return;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - ModelViewController
- (void)wg_presentVC:(UIViewController *)viewController {
    [self wg_presentVC:viewController completion:nil];
}
- (void)wg_presentVC:(UIViewController *)viewController completion:(void(^)(void))completion {
    if (![viewController isKindOfClass:[UIViewController class]]) return;
    [self presentViewController:viewController animated:YES completion:completion];
}
- (void)wg_dismiss {
    [self wg_dismissWithCompletion:nil];
}
- (void)wg_dismissWithCompletion:(void (^)(void))completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}
#pragma mark - ChildViewController
- (void)wg_addChildVC:(UIViewController *)chileVC {
    if (![chileVC isKindOfClass:[UIViewController class]]) return;
    [chileVC willMoveToParentViewController:self];
    [self addChildViewController:chileVC];
    [self.view addSubview:chileVC.view];
    chileVC.view.frame = self.view.frame;
    
}
- (void)wg_removeChildVC:(UIViewController *)chileVC {
    if (![chileVC isKindOfClass:[UIViewController class]]) return;
    [chileVC.view removeFromSuperview];
    [chileVC willMoveToParentViewController:self];
    [chileVC removeFromParentViewController];
}

#pragma mark - CheckNetwork
- (BOOL)isNetworkReachable {
    // 网络是否可用
    return YES;
}
- (void)wg_loadData {
    
}


@end
