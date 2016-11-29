//
//  NSObject+Addition.m
//  WGKitDemo
//
//  Created by dfhb@rdd on 16/11/28.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "NSObject+Addition.h"

@implementation NSObject (Addition)

@end

@implementation NSObject (AppInfo)

- (NSString *)wg_appVersion {
    return [self wg_info][@"CFBundleShortVersionString"];
}
- (NSInteger)wg_appBuild {
    return [[self wg_info][@"CFBundleVersion"] integerValue];
}
- (NSString *)wg_appIdentifier {
    return [self wg_info][@"CFBundleIdentifier"];
}
#pragma mark - private
- (NSDictionary *)wg_info {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return infoDictionary;
}

@end

@implementation NSObject (UIKit)
- (UIViewController *)wg_topViewController {
    UIViewController *topViewController = nil;
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    topViewController = rootViewController;
    // rootViewController == tabbar
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = [(UITabBarController *)rootViewController selectedViewController];
        if ([selectedVC isKindOfClass:[UINavigationController class]]) {
            topViewController = [(UINavigationController *)selectedVC topViewController];
        } else {
            topViewController = selectedVC;
        }
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        topViewController = [(UINavigationController *)rootViewController topViewController];
    }
    
    return topViewController;
}

@end

