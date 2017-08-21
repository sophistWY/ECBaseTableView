//
//  UITableView+BlockDeclare.h
//  ECBaseTableView
//
//  Created by Sophist on 2017/5/3.
//  Copyright © 2017年 dentalink. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef CGFloat(^CellHeightBlock)(UITableView *tableView,id cellModel,NSIndexPath *indexPath);
typedef CGFloat(^TableSectionHeaderHeightBlock)(UITableView *tableView,NSInteger section);
typedef CGFloat(^TableSectionFooterHeightBlock)(UITableView *tableView,NSInteger section);
typedef UIView *(^ConfigureTableSectionHeaderBlock)(UITableView *tableView,NSInteger section);
typedef UIView *(^ConfigureTableSectionFooterBlock)(UITableView *tableView,NSInteger section);
typedef UITableViewCell *(^ConfigCellBlock)(UITableView *tableView,id cellModel,NSIndexPath *indexPath);
typedef void(^ClickTableCellBlock)(UITableView *tableView,id cellModel,UITableViewCell *cell,NSIndexPath *indexPath);

@interface UITableView (BlockDeclare)

@property (nonatomic,copy)CellHeightBlock bk_cellHeightBlock;
@property (nonatomic,copy)TableSectionHeaderHeightBlock bk_sectionHeaderHeight;
@property (nonatomic,copy)TableSectionFooterHeightBlock bk_sectionFooterHeight;
@property (nonatomic,copy)ConfigureTableSectionHeaderBlock bk_sectionHeaderConfig;
@property (nonatomic,copy)ConfigureTableSectionFooterBlock bk_sectionFooterConfig;
//配置cell
@property(nonatomic,copy)ConfigCellBlock bk_cellConfig;
//点击cell
@property (nonatomic,copy)ClickTableCellBlock bk_cellClick;

@end
