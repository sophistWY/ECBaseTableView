//
//  ViewController.m
//  ECBaseTableView
//
//  Created by Sophist on 2017/5/3.
//  Copyright © 2017年 dentalink. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Simple.h"
#define kECScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kECScreenHeight    [UIScreen mainScreen].bounds.size.height
#define kNavHeight 64.0f

@interface ViewController ()

@property(nonatomic,strong)UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *data = [@[@"快速tableView",@"自定义tableView",@"复杂tableView"] mutableCopy];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavHeight, kECScreenWidth, kECScreenHeight - kNavHeight) style:UITableViewStyleGrouped];
    tableView.dataArr = data;
    tableView.blockShow = YES;
    tableView.cellHeight = 44.0f;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    tableView.bk_cellConfig = ^UITableViewCell *(UITableView *tableView, id cellModel, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = data[indexPath.row];
        return cell;
    };
    
    
}






@end
