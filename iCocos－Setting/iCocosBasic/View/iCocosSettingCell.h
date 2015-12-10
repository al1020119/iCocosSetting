//
//  iCocosSettingCell.h
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//

#import <UIKit/UIKit.h>


@class iCocosSettingItem;
@interface iCocosSettingCell : UITableViewCell
@property (nonatomic, strong) iCocosSettingItem *item;

+ (id)settingCellWithTableView:(UITableView *)tableView;


@end
