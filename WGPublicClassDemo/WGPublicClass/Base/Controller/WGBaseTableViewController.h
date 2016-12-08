//
//  WGBaseTableViewController.h
//  自定义小控件
//
//  Created by dfhb@rdd on 16/11/24.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseViewController.h"
#import "WGBaseTableView.h"
#import "WGBaseTableViewCell.h"

@interface WGBaseTableViewController : WGBaseViewController

@property (nonatomic, strong, readonly) WGBaseTableView *tableView;
/** 是否需要分割线 (默认显示) */
@property (nonatomic, assign) BOOL needCellSepLine;
/** 分割线的颜色 */
@property (nonatomic, strong) UIColor *sepLineColor;
/** 初始化 tableView 的样式 */
- (instancetype)initWithStyle:(UITableViewStyle)style;
#pragma mark - 需在子类中重写
/** 组数 */
- (NSInteger)wg_numberOfSections;
/** 某个组的行数 */
- (NSInteger)wg_numberOfRowsInSection:(NSInteger)section;
- (UIView *)wg_headerAtSection:(NSInteger)section;
- (UIView *)wg_footerAtSection:(NSInteger)section;
/** 设置 cell */
- (UITableViewCell *)wg_cellAtIndexPath:(NSIndexPath *)indexPath;
/** 设置行高 */
- (CGFloat)wg_rowHeightAtIndexPath:(NSIndexPath *)indexPath;
/** 设置 sectionHeader 的高 */
- (CGFloat)wg_sectionHeaderHeightAtSection:(NSInteger)section;
/** 设置 sectionFooter 的高 */
- (CGFloat)wg_sectionFooterHeightAtSection:(NSInteger)section;
/** 点击cell */
- (void)wg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(WGBaseTableViewCell *)cell;
/** 设置分割线偏移量 */
- (UIEdgeInsets)wg_sepLineEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath;
@end
