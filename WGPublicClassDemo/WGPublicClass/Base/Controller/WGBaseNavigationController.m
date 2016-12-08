//
//  WGBaseNavigationController.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/11/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseNavigationController.h"
#import "WGHeader.h"

@implementation WGBaseNavigationController

+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    /** 设置为不透明 */
    navBar.translucent = NO;
    /** 设置背景色 */
    navBar.barTintColor = [UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1.00f];
    
    /** 去除导航分割线 */
    [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];
    /** 标题字体大小和颜色 */
    NSDictionary *colors = @{NSForegroundColorAttributeName : kDarkGrayColor,
                                        NSFontAttributeName : kFont(17.0f)};
    navBar.titleTextAttributes = colors;
    
    /** 设置左右ButtonItem整体字体颜色和大小 */
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    /** 系统自带Item(image)颜色 */
    barButtonItem.tintColor = [UIColor redColor];
    
    /** 系统自带Item标题字体大小和颜色 */
    NSDictionary *itemColors = @{NSForegroundColorAttributeName : kMagentaColor,
                                            NSFontAttributeName : kFont(16.0f)};
    [barButtonItem setTitleTextAttributes:itemColors forState:UIControlStateNormal];
    /** 设置系统自带Item标题的偏移量 */
    [barButtonItem setTitlePositionAdjustment:UIOffsetMake(0, 0) forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    if (self.viewControllers.count > 0) {
        /** 添加自定义返回按钮 */
        
    } else {
        viewController.navigationItem.leftBarButtonItem = nil;
    }
    
    [super pushViewController:viewController animated:animated];
}
/** 当调用 setNeedsStatusBarAppearanceUpdate 方法的时候 默认会调用 UINavigationController 的 preferredStatusBarStyle 方法 */
/** 重写该方法的目的是在 ViewController 中可以调用 preferredStatusBarStyle */
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}
@end
