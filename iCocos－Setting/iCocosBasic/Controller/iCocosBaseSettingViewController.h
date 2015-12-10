//
//  iCocosBaseSettingViewController.h
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCocosSettingGroup.h"
#import "iCocosSettingItem.h"

@interface iCocosBaseSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_allGroups; // 所有的组模型
}

@property (nonatomic, assign) double rowHeight;

@end
