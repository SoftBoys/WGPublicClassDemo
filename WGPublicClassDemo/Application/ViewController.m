//
//  ViewController.m
//  WGBaseDemo
//
//  Created by dfhb@rdd on 16/11/29.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "ViewController.h"
#import "WGCategory.h"
#import "WGLocationManager.h"
#import "WGLoadingAnimationView.h"
#import "WGDownloadImageManager.h"
#import "WGBaseRequest.h"
#import "WGRequestManager.h"
#import "NSAttributedString+Addition.h"
#import "WGHeader.h"
#import "WGBaseCopyLabel.h"
#import "WGWebViewController.h"
#import "WGBaseTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试标题";
    
    UIImage *image = [[[UIImage wg_imageWithColor:[UIColor orangeColor] size:CGSizeMake(40, 40)] wg_imageWithCornerRadius:10] wg_resizedImage];
    
    UIImage *backimage = [[[UIImage wg_imageWithColor:[UIColor greenColor] size:CGSizeMake(40, 40)] wg_imageWithCornerRadius:10] wg_resizedImage];
    UIBarButtonItem *barBtnItem = [UIBarButtonItem wg_itemWithImage:image highlightImage:backimage touchBlock:^(id obj) {
        NSLog(@"[%@]", obj);
    }];
//    barBtnItem = [UIBarButtonItem wg_itemWithTitle:@"测试" tintColor:[UIColor brownColor] touchBlock:^(id obj) {
//        NSLog(@"[%@]", obj);
//    }];
    [barBtnItem setBackgroundImage:backimage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [barBtnItem setTitlePositionAdjustment:UIOffsetMake(10, 0) forBarMetrics:UIBarMetricsDefault];
//    [barBtnItem setImageInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    self.navigationItem.rightBarButtonItem = barBtnItem;
    
    UIButton *button1 = [self loadingButtonWithTitle:@"loading1"];
    [self.view addSubview:button1];
    UIButton *button2 = [self loadingButtonWithTitle:@"loading2"];
    button2.wg_left = 200;
    [self.view addSubview:button2];
    
    NSString *text = @"测试一下到底是可以不可以呢,测试一下到底是可以不可以呢,测试一下到底是可以不可以呢,测试一下到底是可以不可以呢";
    NSString *keyword = @"不可以";
    WGBaseCopyLabel *label = [WGBaseCopyLabel wg_labelWithFont:kFont(16) textColor:kBlackColor];
    label.numberOfLines = 0;
    label.attributedText = [NSAttributedString wg_attStringWithString:text keyWord:keyword font:kFont(16) highlightColor:kRedColor textColor:kGrayColor lineSpace:2 searhType:kAttributedSearchTypeSingle];
    label.backgroundColor = [UIColor orangeColor];
    label.wg_origin = CGPointMake(100, 20);
    label.wg_width = 180;
    [label sizeToFit];
    [self.view addSubview:label];
    
    [self testRequest];
    
    [self testString];
}

- (UIButton *)loadingButtonWithTitle:(NSString *)title {
    
    UIImage *backImage = [UIImage wg_imageWithColor:[UIColor orangeColor] size:CGSizeMake(80, 80)];
    backImage = [[backImage wg_imageWithCornerRadius:40 borderWidth:1.0 borderColor:[UIColor greenColor]] wg_resizedImage];
    
    __weak typeof(self) weakself = self;
    UIButton *button = [UIButton wg_buttonWithImage:nil hightImage:nil backImage:backImage touchBlock:^(UIButton *button) {
        [weakself wg_buttonClick:button];
    }];
    [button setTitle:title forState:UIControlStateNormal];
    button.wg_left = 40;
    button.wg_top = 140;
    button.wg_width = 80;
    button.wg_height = 80;
    button.backgroundColor = [UIColor lightGrayColor];
    return button;
}

- (void)wg_buttonClick:(UIButton *)button {
    
    if ([[button titleForState:UIControlStateNormal] isEqualToString:@"loading1"]) {
        
        [self wg_showLoadingView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self wg_hideLoadingView];
        });
    } else {
        WGLoadingAnimationView *animationView = [WGLoadingAnimationView new];
        [animationView showInView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [animationView dismiss];
        });
    }
    
    
}
- (IBAction)presentClick:(id)sender {
    WGBaseWebViewController *viewController = [WGBaseWebViewController new];
    viewController.navigationItem.title = @"sencondVC1";
//    viewController.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 20, 60, 60);
    button.backgroundColor = [UIColor greenColor];
    [viewController.view addSubview:button];
    [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self wg_presentVC:viewController completion:nil];
}
- (IBAction)pushClick:(id)sender {
    WGBaseTableViewController *viewController = [WGBaseTableViewController new];
    viewController.navigationItem.title = @"sencondVC2";
    viewController.view.backgroundColor = [UIColor redColor];
    [self wg_pushVC:viewController];
}

- (void)backClick {
    [(WGBaseViewController *)self.presentedViewController wg_dismiss];
}
- (IBAction)webClick:(id)sender {
    WGWebViewController *webVC = [WGWebViewController new];
    [self wg_pushVC:webVC];
}

- (void)testRequest {
    NSString *url = @"http://m.vvgong.cn/linggb-ws/ws/0.1/clientVersion/versionForIOS";
    NSDictionary *parameters = @{@"flag":@1};
    
    [WGRequestManager setBaseUrl:@"http://m.vvgong.cn"];
    
    WGBaseRequest *request1 = [WGBaseRequest wg_requestWithUrl:url];
    request1.wg_parameters = parameters;
    [request1 wg_sendRequestWithCompletion:^(WGBaseResponse *response) {
        
    }];
    
    WGBaseRequest *request2 = [WGBaseRequest wg_requestWithUrl:nil];
    [request2 wg_sendRequestWithCompletion:^(WGBaseResponse *response) {
        
    }];
    
    WGBaseRequest *request3 = [WGBaseRequest wg_requestWithUrl:url];
    [request3 wg_sendRequestWithCompletion:^(WGBaseResponse *response) {
        
    }];
    
    WGBaseRequest *request4 = [WGBaseRequest wg_requestWithUrl:url];
    [request4 wg_sendRequestWithCompletion:^(WGBaseResponse *response) {
        
    }];
    
    [WGRequestManager cancelTask:nil];
    NSLog(@"allTask:%@", [WGRequestManager allTask]);
}

- (void)testString {
    NSString *version1 = @"1.0.3";
    NSString *version2 = @"1.1";
    if ([version1 wg_isOlderVersionThan:version2]) {
        NSLog(@"old");
    } else {
        NSLog(@"new");
    }
}
@end
