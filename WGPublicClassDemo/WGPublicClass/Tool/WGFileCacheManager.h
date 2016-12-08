//
//  WGFileCacheManager.h
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/1.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGFileCacheManager : NSObject
/** 把对象归档存到沙盒Cache路径下 */
+ (BOOL)saveObject:(id)obj byFileName:(NSString *)fileName;
/** 从沙盒Cache中拿到归档对象 */
+ (id)objectByFileName:(NSString *)fileName;
/** 删除归档对象 */
+ (void)removeObjectByFileName:(NSString *)fileName;
#pragma mark - UserDefault
/** 存储数据到 UserDefault 中 */
+ (void)saveUserData:(id)data forKey:(NSString *)key;
/** 读取 UserDefault 中的数据 */
+ (id)userDataForKey:(NSString *)key;
/** 删除 UserDefault 中的数据 */
+ (void)removeUserDataForKey:(NSString *)key;
@end
