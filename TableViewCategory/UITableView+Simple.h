//
//  UITableView+Simple.h
//  ECBaseTableView
//
//  Created by Sophist on 2017/5/3.
//  Copyright © 2017年 dentalink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+BlockDeclare.h"

@interface UITableView (Simple)

/**
 是否选择block设置cell
 */
@property(nonatomic,assign)BOOL blockShow;

/**
 数据源(设置数据源会调用reloadData)
 */
@property(nonatomic,strong)NSMutableArray *dataArr;

// ---可选
@property(nonatomic,copy)NSString *cellid;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGFloat sectionHeight;



@end
