//
//  WGBaseTableViewCell.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/6.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseTableViewCell.h"

@implementation WGBaseTableViewCell

+ (instancetype)wg_cellWithTableView:(UITableView *)tableView {
    if (tableView == nil) {
        return [[self alloc] init];
    }
    NSString *identifier = [NSStringFromClass(self.class) stringByAppendingString:@"ID"];
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
