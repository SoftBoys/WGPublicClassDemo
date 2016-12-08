//
//  WGBaseWebViewController.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/6.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseWebViewController.h"
#import "WGHeader.h"

@interface WGBaseWebViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *progressView;
@end
@implementation WGBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
    // 监听进度条的进度
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        double progress = [change[NSKeyValueChangeNewKey] doubleValue];
        //        NSLog(@"%.2f", pregress);
        [UIView animateWithDuration:0.1 animations:^{
            CGRect frame = self.progressView.frame;
            frame.size.width = kScreenWidth * (progress);
            //            NSLog(@"width:%.2f", frame.size.width);
            self.progressView.frame = frame;
        } completion:^(BOOL finished) {
            if (progress >= 1.0) {
                self.progressView.hidden = YES;
            }
        }];
    }
}
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (UIColor *)progressColor {
    return kBlueColor;
}
#pragma mark - getter && setter
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.navigationDelegate = self;
        _webView.frame = self.view.bounds;
        _webView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _webView.backgroundColor = [UIColor orangeColor];
//        _webView.scrollView.contentInset = UIEdgeInsetsMake(kTopBarHeight, 0, 0, 0);
    }
    return _webView;
}
- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [UIView new];
        float progressH = 2.0f;
        float progressY = 0;
        _progressView.frame = CGRectMake(0, progressY, 0, progressH);
        _progressView.backgroundColor = [self progressColor] ?:kBlueColor;
    }
    return _progressView;
}
#pragma mark - WKNavigationDelegate

@end
