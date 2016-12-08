//
//  WGBaseModel.h
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/5.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGBaseModel : NSObject
/** 归档 - 存入模型 (以本身类名命名) */
- (void)wg_archive;
/** 解档 - 取出模型 (以本身类名命名) */
+ (id)wg_unarchive;
/** 移除缓存数据 */
- (void)wg_remove;

/** 将属性名换为其他key去字典中取值 (新Key:被替换的Key) */
+ (void)setUpModelReplacedKeyWithDict:(NSDictionary *)dict;
/** 字典转模型 */
+ (instancetype)modelWithDictionry:(NSDictionary *)dict;
/** 字典数组转模型数组 */
+ (NSArray *)modelArrayWithDictArray:(NSArray *)dictArray;
/** 模型转字典 */
- (NSDictionary *)wg_keyValues;
/** 转换为字典或者数组 */
- (id)wg_JSONObject;
/** 转换为JSON字符串 */
- (NSString *)wg_JSONString;

@end
