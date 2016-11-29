//
//  NSObject+Addition.h
//  WGKitDemo
//
//  Created by dfhb@rdd on 16/11/28.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Addition)

@end

@interface NSObject (AppInfo)
/** App版本号 */
- (NSString *)wg_appVersion;
/** App构造版本 */
- (NSInteger)wg_appBuild;
/** App构造版本 */
- (NSString *)wg_appIdentifier;
@end

@interface NSObject (UIKit)
/** 当前视图控制器 */
- (UIViewController *)wg_topViewController;
@end







