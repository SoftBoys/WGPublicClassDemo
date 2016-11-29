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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *backImage = [UIImage wg_imageWithColor:[UIColor orangeColor] size:CGSizeMake(100, 100)];
    backImage = [backImage wg_imageWithCornerRadius:20 borderWidth:0 borderColor:[UIColor greenColor]];
    __weak typeof(self) weakself = self;
    UIButton *button = [UIButton wg_buttonWithImage:nil hightImage:nil backImage:backImage touchBlock:^(UIButton *button) {
        [weakself wg_buttonClick];
    }];
    button.wg_left = 100;
    button.wg_top = 90;
    button.wg_width = 180;
    button.wg_height = 180;
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    
    [[WGLocationManager shareManager] startLocationWithSuccess:^(WGLocationInfo *info) {
        NSLog(@"info:%@",info);
    } fail:^(NSError *error) {
        NSLog(@"error:%@", error);
    }];
    
}

- (void)wg_buttonClick {
    
    [self wg_showLoadingView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self wg_hideLoadingView];
    });
    
}
- (IBAction)presentClick:(id)sender {
    WGBaseViewController *viewController = [WGBaseViewController new];
    viewController.navigationItem.title = @"sencondVC1";
    viewController.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 20, 60, 60);
    button.backgroundColor = [UIColor greenColor];
    [viewController.view addSubview:button];
    [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self wg_presentVC:viewController completion:nil];
}
- (IBAction)pushClick:(id)sender {
    UIViewController *viewController = [UIViewController new];
    viewController.navigationItem.title = @"sencondVC2";
    viewController.view.backgroundColor = [UIColor redColor];
    [self wg_pushVC:viewController];
}

- (void)backClick {
    [(WGBaseViewController *)self.presentedViewController wg_dismiss];
}


@end
