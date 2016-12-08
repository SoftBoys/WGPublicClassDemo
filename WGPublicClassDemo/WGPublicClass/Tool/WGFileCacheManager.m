//
//  WGFileCacheManager.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/1.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGFileCacheManager.h"
#import "NSFileManager+Paths.h"

@implementation WGFileCacheManager

+ (BOOL)saveObject:(id)obj byFileName:(NSString *)fileName {
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:obj toFile:path];
    return success;
}
+ (id)objectByFileName:(NSString *)fileName {
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    id data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return data;
}
+ (void)removeObjectByFileName:(NSString *)fileName {
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

#pragma mark - UserDefault
+ (void)saveUserData:(id)data forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (id)userDataForKey:(NSString *)key {
    id data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return data;
}
+ (void)removeUserDataForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - private
+ (NSString *)appendFilePath:(NSString *)fileName {
    NSString *cachePath = [NSFileManager wg_cachesPath];
    NSString *filePath = [cachePath stringByAppendingString:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
}

@end
