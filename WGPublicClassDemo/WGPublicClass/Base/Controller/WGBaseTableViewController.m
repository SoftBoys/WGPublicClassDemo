//
//  WGBaseTableViewController.m
//  自定义小控件
//
//  Created by dfhb@rdd on 16/11/24.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseTableViewController.h"
#import "WGBaseTableViewCell.h"

@interface WGBaseTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) WGBaseTableView *tableView;
@end
@implementation WGBaseTableViewController
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super init]) {
        self.tableView = [WGBaseTableView wg_tableViewWithStyle:style];
        self.tableView.frame = self.view.frame;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.backgroundColor = [UIColor redColor];
//    self.sepLineColor = [UIColor orangeColor];
}

- (void)setNeedCellSepLine:(BOOL)needCellSepLine {
//    _needCellSepLine = needCellSepLine;
    self.tableView.separatorStyle = needCellSepLine ? UITableViewCellSeparatorStyleSingleLine:UITableViewCellSeparatorStyleNone;
}
- (BOOL)needCellSepLine {
    return self.tableView.separatorStyle == UITableViewCellSeparatorStyleSingleLine;
}
- (void)setSepLineColor:(UIColor *)sepLineColor {
    if (!self.needCellSepLine) return;
    _sepLineColor = sepLineColor;
    self.tableView.separatorColor = sepLineColor;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(wg_cellAtIndexPath:)]) {
        return [self wg_cellAtIndexPath:indexPath];
    }
    WGBaseTableViewCell *cell = [WGBaseTableViewCell wg_cellWithTableView:tableView];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self respondsToSelector:@selector(wg_numberOfSections)]) {
        return [self wg_numberOfSections];
    }
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(wg_numberOfRowsInSection:)]) {
        return [self wg_numberOfRowsInSection:section];
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(wg_headerAtSection:)]) {
        return [self wg_headerAtSection:section];
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(wg_footerAtSection:)]) {
        [self wg_footerAtSection:section];
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(wg_sectionHeaderHeightAtSection:)]) {
        return [self wg_sectionHeaderHeightAtSection:section];
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(wg_sectionFooterHeightAtSection:)]) {
        return [self wg_sectionFooterHeightAtSection:section];
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(wg_rowHeightAtIndexPath:)]) {
        return [self wg_rowHeightAtIndexPath:indexPath];
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WGBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([self respondsToSelector:@selector(wg_didSelectCellAtIndexPath:cell:)]) {
        [self wg_didSelectCellAtIndexPath:indexPath cell:cell];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.needCellSepLine) return;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    if ([self respondsToSelector:@selector(wg_sepLineEdgeInsetsAtIndexPath:)]) {
        edgeInsets = [self wg_sepLineEdgeInsetsAtIndexPath:indexPath];
    }
    tableView.separatorInset = edgeInsets;
    tableView.layoutMargins = edgeInsets;
    
    cell.separatorInset = edgeInsets;
    cell.layoutMargins = edgeInsets;
    
}
#pragma mark - 需在子类中重写
- (NSInteger)wg_numberOfSections {
    return 1;
}
- (NSInteger)wg_numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)wg_cellAtIndexPath:(NSIndexPath *)indexPath {
    WGBaseTableViewCell *cell = [WGBaseTableViewCell wg_cellWithTableView:self.tableView];
    return cell;
}
- (CGFloat)wg_sectionHeaderHeightAtSection:(NSInteger)section {
    return 10;
}
- (CGFloat)wg_sectionFooterHeightAtSection:(NSInteger)section {
    return 10;
}
- (CGFloat)wg_rowHeightAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (UIEdgeInsets)wg_sepLineEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(0, 15, 0, 0);
}
- (UIView *)wg_headerAtSection:(NSInteger)section {
    return nil;
}
- (UIView *)wg_footerAtSection:(NSInteger)section {
    return nil;
}
- (void)wg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(WGBaseTableViewCell *)cell {
    
}
@end
