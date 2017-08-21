//
//  UITableView+BlockDeclare.m
//  ECBaseTableView
//
//  Created by Sophist on 2017/5/3.
//  Copyright © 2017年 dentalink. All rights reserved.
//

#import "UITableView+BlockDeclare.h"
#import <objc/runtime.h>

static const void *key_bk_cellHeightBlock       = &key_bk_cellHeightBlock;
static const void *key_bk_sectionHeaderHeight   = &key_bk_sectionHeaderHeight;
static const void *key_bk_sectionFooterHeight   = &key_bk_sectionFooterHeight;
static const void *key_bk_sectionHeaderConfig   = &key_bk_sectionHeaderConfig;
static const void *key_bk_sectionFooterConfig   = &key_bk_sectionFooterConfig;
static const void *key_bk_cellConfig            = &key_bk_cellConfig;
static const void *key_bk_cellClick             = &key_bk_cellClick;

@implementation UITableView (BlockDeclare)

-(CellHeightBlock)bk_cellHeightBlock
{
   return objc_getAssociatedObject(self, key_bk_cellHeightBlock);
}

-(void)setBk_cellHeightBlock:(CellHeightBlock)bk_cellHeightBlock
{
   objc_setAssociatedObject(self, key_bk_cellHeightBlock, bk_cellHeightBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(TableSectionHeaderHeightBlock)bk_sectionHeaderHeight
{
  return objc_getAssociatedObject(self, key_bk_sectionHeaderHeight);
}

-(void)setBk_sectionHeaderHeight:(TableSectionHeaderHeightBlock)bk_sectionHeaderHeight
{
    objc_setAssociatedObject(self, key_bk_sectionHeaderHeight, bk_sectionHeaderHeight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(TableSectionFooterHeightBlock)bk_sectionFooterHeight
{
    return objc_getAssociatedObject(self, key_bk_sectionFooterHeight);
}

-(void)setBk_sectionFooterHeight:(TableSectionFooterHeightBlock)bk_sectionFooterHeight
{
    objc_setAssociatedObject(self, key_bk_sectionFooterHeight, bk_sectionFooterHeight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(ConfigureTableSectionHeaderBlock)bk_sectionHeaderConfig
{
    return objc_getAssociatedObject(self, key_bk_sectionHeaderConfig);
}
-(void)setBk_sectionHeaderConfig:(ConfigureTableSectionHeaderBlock)bk_sectionHeaderConfig
{
    objc_setAssociatedObject(self, key_bk_sectionHeaderConfig, bk_sectionHeaderConfig, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(ConfigureTableSectionFooterBlock)bk_sectionFooterConfig
{
    return objc_getAssociatedObject(self, key_bk_sectionFooterConfig);
}

-(void)setBk_sectionFooterConfig:(ConfigureTableSectionFooterBlock)bk_sectionFooterConfig
{
    objc_setAssociatedObject(self, key_bk_sectionFooterConfig, bk_sectionFooterConfig, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(ConfigCellBlock)bk_cellConfig
{
    return objc_getAssociatedObject(self, key_bk_cellConfig);
}

-(void)setBk_cellConfig:(ConfigCellBlock)bk_cellConfig
{
    objc_setAssociatedObject(self, key_bk_cellConfig, bk_cellConfig, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(ClickTableCellBlock)bk_cellClick
{
   return objc_getAssociatedObject(self, key_bk_cellClick);
}

-(void)setBk_cellClick:(ClickTableCellBlock)bk_cellClick
{
    objc_setAssociatedObject(self, key_bk_cellClick, bk_cellClick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}














@end
