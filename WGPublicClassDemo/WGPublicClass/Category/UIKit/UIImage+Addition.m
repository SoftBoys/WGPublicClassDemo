//
//  UIImage+Addition.m
//  WGKitDemo
//
//  Created by dfhb@rdd on 16/11/25.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)
+ (UIImage *)wg_resizedImageWithName:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    return [normal wg_resizedImage];
//    UIImage *image = [normal stretchableImageWithLeftCapWidth:imageW topCapHeight:imageH];
}
- (UIImage *)wg_resizedImage {
    CGFloat imageW = self.size.width * 0.5;
    CGFloat imageH = self.size.height * 0.5;
    return [self wg_resizedImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}
- (UIImage *)wg_resizedImageWithCapInsets:(UIEdgeInsets)capInsets {
    return [self resizableImageWithCapInsets:capInsets];
}
- (UIImage *)wg_resizedImageWithNewSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, [UIScreen mainScreen].scale);
    [self drawInRect:(CGRect){0,0,newSize}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end

@implementation UIImage (Color)

+ (UIImage *)wg_imageWithColor:(UIColor *)color {
    CGSize imageSize = CGSizeMake(1.0, 1.0);
    return [self wg_imageWithColor:color size:imageSize];
}
+ (UIImage *)wg_imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)wg_circleImage {
    CGSize size = self.size;
    float corner = MIN(size.width, size.height);
    return [self wg_imageWithCornerRadius:corner];
}
- (UIImage *)wg_imageWithCornerRadius:(CGFloat)cornerRadius {
    return [self wg_imageWithCornerRadius:cornerRadius borderWidth:0 borderColor:nil];
}
- (UIImage *)wg_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    CGRect rect = (CGRect){0, 0, self.size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (cornerRadius > 0) {
        rect = CGRectMake(borderWidth/2, borderWidth/2, self.size.width-borderWidth, self.size.height-borderWidth);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
        CGContextAddPath(context, path.CGPath);
        if (borderWidth > 0) {
            CGContextSetLineWidth(context, borderWidth);
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextDrawPath(context, kCGPathFillStroke);
        } else {
            
        }
        [path addClip];
    } else {
        if (borderWidth > 0) {
            rect = CGRectMake(borderWidth/2, borderWidth/2, self.size.width-borderWidth, self.size.height-borderWidth);
            CGContextSetLineWidth(context, borderWidth);
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextStrokeRect(context, rect);
        } else {
            
        }
    }
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end