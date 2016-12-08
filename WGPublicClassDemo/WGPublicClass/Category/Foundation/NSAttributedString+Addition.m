//
//  NSAttributedString+Addition.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/2.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "NSAttributedString+Addition.h"
#import "WGHeader.h"

@implementation NSAttributedString (Addition)

+ (NSAttributedString *)wg_attStringWithString:(NSString *)string keyWord:(NSString *)keyWord {
    return [self wg_attStringWithString:string keyWord:keyWord font:kFont(16) highlightColor:kRedColor textColor:kBlackColor];
}
+ (NSAttributedString *)wg_attStringWithString:(NSString *)string keyWord:(NSString *)keyWord font:(UIFont *)font highlightColor:(UIColor *)highlightColor textColor:(UIColor *)textColor {
    return [self wg_attStringWithString:string keyWord:keyWord font:font highlightColor:highlightColor textColor:textColor lineSpace:2.0 searhType:kAttributedSearchTypeAll];
}
+ (NSAttributedString *)wg_attStringWithString:(NSString *)string keyWord:(NSString *)keyWord font:(UIFont *)font highlightColor:(UIColor *)highlightColor textColor:(UIColor *)textColor lineSpace:(CGFloat)lineSpace searhType:(WGAttributedSearchType)searhType {
    
    if (string == nil || string.length == 0) {
        return nil;
    }
    NSMutableAttributedString *muAttStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange allRange = NSMakeRange(0, string.length);
    if (font) {
        [muAttStr addAttribute:NSFontAttributeName value:font range:allRange];
    }
    if (textColor) {
        [muAttStr addAttribute:NSForegroundColorAttributeName value:textColor range:allRange];
    }
    if (keyWord.length) {
        // 只能搜索最前面一个
        if (searhType == kAttributedSearchTypeSingle) {
            NSRange keyRange = [string rangeOfString:keyWord options:NSCaseInsensitiveSearch];
            [muAttStr addAttribute:NSForegroundColorAttributeName value:highlightColor range:keyRange];
        } else if (searhType == kAttributedSearchTypeAll) { // 全局搜索
            NSString *newString = string;
            NSRange keyRange = [newString rangeOfString:keyWord options:NSCaseInsensitiveSearch];
            NSInteger fromIndex = 0;
            
            while (keyRange.location != NSNotFound) {
                NSRange newRange = NSMakeRange(fromIndex+keyRange.location, keyRange.length);
                [muAttStr addAttribute:NSForegroundColorAttributeName value:highlightColor range:newRange];
                fromIndex = newRange.length+newRange.location;
                if (fromIndex < string.length) {
                    newString = [string substringFromIndex:fromIndex];
                    keyRange = [newString rangeOfString:keyWord options:NSCaseInsensitiveSearch];
                } else {
                    break;
                }
            }
        }
        
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    [muAttStr addAttribute:NSParagraphStyleAttributeName value:style range:allRange];
    
    return [muAttStr copy];
}



@end
