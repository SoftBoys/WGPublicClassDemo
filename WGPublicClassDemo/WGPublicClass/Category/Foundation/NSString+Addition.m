//
//  NSString+Addition.m
//  WGKitDemo
//
//  Created by dfhb@rdd on 16/11/28.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Addition)

- (NSString *)wg_MD5 {
    if (self == nil || self.length == 0) {
        return nil;
    }
    NSData *inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([inputData bytes], (CC_LONG)inputData.length, outputData);
    NSMutableString *md5Str = @"".mutableCopy;
    for (NSUInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5Str appendFormat:@"%02x", outputData[i]];
    }
    return md5Str;
}
- (BOOL)wg_isNumber {
    NSString *regex = @"^[0-9]*$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pre evaluateWithObject:self];
}


@end

@implementation NSString (Version)

- (BOOL)wg_isOlderVersionThan:(NSString *)otherVersion {
    return [self compare:otherVersion options:NSNumericSearch] == NSOrderedAscending;
}
- (BOOL)wg_isNewerVersionThan:(NSString *)otherVersion {
    return [self compare:otherVersion options:NSNumericSearch] == NSOrderedDescending;
}

@end