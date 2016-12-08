//
//  WGBaseModel.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/5.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseModel.h"
#import "WGFileCacheManager.h"
#import <MJExtension.h>


@implementation WGBaseModel
/** 支持归档 */
MJExtensionCodingImplementation
- (void)wg_archive {
    [WGFileCacheManager saveObject:self byFileName:[self.class description]];
}
+ (id)wg_unarchive {
    id obj = [WGFileCacheManager objectByFileName:[[self class] description]];
    return obj;
}
- (void)wg_remove {
    [WGFileCacheManager removeObjectByFileName:[self.class description]];
}

#pragma mark - MJExtension
+ (instancetype)modelWithDictionry:(NSDictionary *)dict {
    if (dict == nil || ![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return [self mj_objectWithKeyValues:dict];
}
+ (NSArray *)modelArrayWithDictArray:(NSArray *)dictArray {
    if (dictArray && [dictArray isKindOfClass:[NSArray class]]) {
        NSMutableArray *modelArray = [self mj_objectArrayWithKeyValuesArray:dictArray];
        return [modelArray copy];
    }
    return nil;
}

+ (void)setUpModelReplacedKeyWithDict:(NSDictionary *)dict {
    if (dict && [dict isKindOfClass:[NSDictionary class]]) {
        [self mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return dict;
        }];
    }
}

- (NSDictionary *)wg_keyValues {
    return [[self mj_keyValues] copy];
}
- (id)wg_JSONObject {
    return [self mj_JSONObject];
}
- (NSString *)wg_JSONString {
    return [self mj_JSONString];
}


@end
