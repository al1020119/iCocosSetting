//
//  iCocosBaseSettingViewController.m
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//

#import "iCocosBaseSettingViewController.h"
#import "iCocosSettingCell.h"


@interface iCocosBaseSettingViewController ()

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation iCocosBaseSettingViewController

- (void)loadView
{
    /**
     添加TableView
     
     - returns: return value description
     */
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
    
    tableView.rowHeight = self.rowHeight;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allGroups = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:235 / 255.0];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    iCocosSettingGroup *group = _allGroups[section];
    return group.items.count;
}

#pragma mark 每当有一个cell进入视野范围内就会调用，返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建一个iCocosSettingCell
    iCocosSettingCell *cell = [iCocosSettingCell settingCellWithTableView:tableView];
    
    // 2.取出这行对应的模型（iCocosSettingItem）
    iCocosSettingGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

#pragma mark 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.取出这行对应的模型
    iCocosSettingGroup *group = _allGroups[indexPath.section];
    iCocosSettingItem *item = group.items[indexPath.row];
    
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    iCocosSettingGroup *group = _allGroups[section];
    
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    iCocosSettingGroup *group = _allGroups[section];
    
    return group.footer;
}


#pragma mark 返回每一组的footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    iCocosSettingGroup *group = _allGroups[section];
    return group.footerHeight;
}

#pragma mark 返回每一组的header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    iCocosSettingGroup *group = _allGroups[section];
    return group.headerHeight;
}



@end
