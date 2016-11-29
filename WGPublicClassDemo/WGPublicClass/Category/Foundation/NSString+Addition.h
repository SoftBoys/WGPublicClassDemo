//
//  NSString+Addition.h
//  WGKitDemo
//
//  Created by dfhb@rdd on 16/11/28.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)
/** MD5加密 */
- (NSString *)wg_MD5;
/** 数字0-9 */
- (BOOL)wg_isNumber;
@end
