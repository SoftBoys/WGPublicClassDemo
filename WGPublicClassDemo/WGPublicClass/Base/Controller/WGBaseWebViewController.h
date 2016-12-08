//
//  WGBaseWebViewController.h
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/6.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseViewController.h"
#import <WebKit/WebKit.h>

@interface WGBaseWebViewController : WGBaseViewController <WKNavigationDelegate>
@property (nonatomic, strong, readonly) WKWebView *webView;
@property (nonatomic, strong, readonly) UIView *progressView;
/** 进度条颜色 (默认为蓝色) */
- (UIColor *)progressColor;
@end
