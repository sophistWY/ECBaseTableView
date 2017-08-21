//
//  UITableView+Simple.m
//  ECBaseTableView
//
//  Created by Sophist on 2017/5/3.
//  Copyright © 2017年 dentalink. All rights reserved.
//

#import "UITableView+Simple.h"
#import <objc/runtime.h>

static const void *key_cellid                   = &key_cellid;
static const void *key_cellHeight               = &key_cellHeight;
static const void *key_sectionHeight            = &key_sectionHeight;

static const void *key_scrollWasEnabled         = &key_scrollWasEnabled;
static const void *key_placeHolderView          = &key_placeHolderView;
static const void *key_isMutiSection            = &key_isMutiSection;
static const void *key_blockShow                = &key_blockShow;
static const void *key_dataArr                  = &key_dataArr;


@interface UITableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) BOOL scrollWasEnabled;
@property (nonatomic, strong) UIView *placeHolderView;
@property (nonatomic,assign) BOOL isMutiSection;

@end

@implementation UITableView (Simple)


-(NSString *)cellid
{
    return objc_getAssociatedObject(self, key_cellid);
}
-(void)setCellid:(NSString *)cellid
{
    objc_setAssociatedObject(self, key_cellid, cellid, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGFloat)cellHeight
{
    NSNumber *cellHeightObject = objc_getAssociatedObject(self, key_cellHeight);
    return [cellHeightObject floatValue];
}

-(void)setCellHeight:(CGFloat)cellHeight
{
    NSNumber *cellHeightObject = [NSNumber numberWithDouble:cellHeight];
    objc_setAssociatedObject(self, key_cellHeight, cellHeightObject, OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)sectionHeight
{
    NSNumber *sectionHeightObject = objc_getAssociatedObject(self, key_sectionHeight);
    return [sectionHeightObject floatValue];
}

-(void)setSectionHeight:(CGFloat)sectionHeight
{
    NSNumber *sectionHeightObject = [NSNumber numberWithDouble:sectionHeight];
    objc_setAssociatedObject(self, key_sectionHeight, sectionHeightObject, OBJC_ASSOCIATION_ASSIGN);
}


- (BOOL)scrollWasEnabled
{
    NSNumber *scrollWasEnabledObject = objc_getAssociatedObject(self, key_scrollWasEnabled);
    return [scrollWasEnabledObject boolValue];
}
- (void)setScrollWasEnabled:(BOOL)scrollWasEnabled
{
    NSNumber *scrollWasEnabledObject = [NSNumber numberWithBool:scrollWasEnabled];
    objc_setAssociatedObject(self, key_scrollWasEnabled, scrollWasEnabledObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)placeHolderView
{
    return objc_getAssociatedObject(self, key_placeHolderView);

}
- (void)setPlaceHolderView:(UIView *)placeHolderView
{
    objc_setAssociatedObject(self, key_placeHolderView, placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isMutiSection
{
    NSNumber *number = objc_getAssociatedObject(self,key_isMutiSection);
    return [number boolValue];

}

-(void)setIsMutiSection:(BOOL)isMutiSection
{
    NSNumber *isMutiSectionObject = [NSNumber numberWithBool:isMutiSection];
    objc_setAssociatedObject(self, key_isMutiSection, isMutiSectionObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)blockShow
{
    NSNumber *blockShowObject = objc_getAssociatedObject(self, key_blockShow);
    return [blockShowObject boolValue];

}

-(void)setBlockShow:(BOOL)blockShow
{
    NSNumber *blockShowObject = [NSNumber numberWithBool:blockShow];
    objc_setAssociatedObject(self,key_blockShow, blockShowObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (blockShow) {
        self.dataSource = self;
        self.delegate = self;
    }else{
        if (self.dataSource == self) {
            self.dataSource = nil;
        }
        if (self.delegate == self) {
            self.delegate = nil;
        }
    }
}


-(NSMutableArray *)dataArr
{
    return objc_getAssociatedObject(self, key_dataArr);
}

- (void)setDataArr:(NSMutableArray *)dataArr{
    objc_setAssociatedObject(self, key_dataArr, dataArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (dataArr.count > 0) {
        id object = [dataArr firstObject];
        if ([object isKindOfClass:[NSArray class]]) {
            self.isMutiSection = YES;
        }else{
            self.isMutiSection = NO;
        }
    }
    
    [self reloadData];
}



#pragma mark - Data source deledate
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isMutiSection) {
        NSArray *arr = self.dataArr[section];
        if ([arr isKindOfClass:[NSArray class]]) {
            return arr.count;
        }
    }else{
        return self.dataArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.isMutiSection? self.dataArr[indexPath.section][indexPath.row]:self.dataArr[indexPath.row];
    UITableViewCell *cell;
    if (self.bk_cellConfig) {
        cell = self.bk_cellConfig(tableView,model,indexPath);
    }else{
        static NSString *cellid = @"cell";
        if (self.cellid) {
            cellid = self.cellid;
        }
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    return cell;
}

#pragma clang diagnostic pop
#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isMutiSection) {
        return self.dataArr.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = nil;
    if (self.isMutiSection) {
        model = self.dataArr[indexPath.section][indexPath.row];
    }else{
        model = self.dataArr[indexPath.row];
    }
    ;
    if (self.bk_cellHeightBlock) {
        return self.bk_cellHeightBlock(tableView,model,indexPath);
    }else if (self.cellHeight){
        return self.cellHeight;
    }
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.bk_sectionHeaderHeight) {
        return self.bk_sectionHeaderHeight(tableView,section);
    }
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.bk_sectionFooterHeight) {
        return self.bk_sectionFooterHeight(tableView,section);
    }else if (self.sectionHeight){
        return self.sectionHeight;
    }
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.bk_sectionHeaderConfig) {
        return  self.bk_sectionHeaderConfig(tableView,section);
    };
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.bk_sectionFooterConfig) {
        return self.bk_sectionFooterConfig(tableView,section);
    };
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self getRowModelWithIndexPath:indexPath];
    UITableViewCell *rowCell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.bk_cellClick) {
        self.bk_cellClick(tableView,model,rowCell,indexPath);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Tools
-(id)getRowModelWithIndexPath:(NSIndexPath *)indexPath
{
    id model = nil;
    if (self.dataArr > 0) {
        if (self.isMutiSection) {
            model = self.dataArr[indexPath.section][indexPath.row];
        }else{
            model = self.dataArr[indexPath.row];
        }
    }
    return model;
}





@end
