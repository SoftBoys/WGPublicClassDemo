//
//  WGLoadingAnimationView.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/11/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGLoadingAnimationView.h"
#import "UIColor+Addition.h"
#import "UIImage+Addition.h"

@interface WGLoadingAnimationView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray<UIImage *> *imageArray;
@end

@implementation WGLoadingAnimationView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor wg_red:0.94*255 green:0.94*255 blue:0.94*255];
        [self addSubview:self.imageView];
    }
    return self;
}

- (NSArray<UIImage *> *)animationImageArray {
    
    NSMutableArray *images = @[].mutableCopy;
    
    for (NSInteger i = 0; i < 20; i++) {
        NSInteger red = arc4random() % 255;
        NSInteger green = arc4random() % 255;
        NSInteger blue = arc4random() % 255;
        red = (100 + i * 2.6);
        green = red*3.5 + 20;
        blue = red*2.5 + 80;
        UIImage *image = [[UIImage wg_imageWithColor:[UIColor wg_red:red%255 green:green%255 blue:blue%255]] wg_resizedImage];
        [images addObject:image];
    }
    return [images copy];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}
- (void)showInView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    self.frame = view.bounds;
    self.imageView.frame = CGRectMake(0, 0, 60, 60);
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.center = self.center;
    
    self.imageView.animationDuration = 1.0f;
    self.imageView.animationRepeatCount = 0;
    self.imageView.animationImages = [self animationImageArray];
    
    [self.imageView startAnimating];
    
    [view addSubview:self];
}

- (void)dismiss {
    [self.imageView stopAnimating];
    [self.imageView removeFromSuperview];
    [self removeFromSuperview];

}
@end
