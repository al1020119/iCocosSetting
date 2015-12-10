//
//  iCocosSettingItem.m
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//

#import "iCocosSettingItem.h"

@implementation iCocosSettingItem

/**
 *  初始化Cell
 *
 *  @param icon  图片
 *  @param title 标题
 *  @param type  描述文字
 *  @param desc  描述文字颜色
 *
 *  @return 对应Cell模型
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type desc:(NSString *)desc
{
    iCocosSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    item.desc = desc;
    return item;
}

/**
 *  初始化Cell
 *
 *  @param icon  图片
 *  @param title 标题
 *  @param type  描述文字
 *  @param desc  描述文字颜色
 *
 *  @return 对应Cell模型
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type image:(UIImage *)image
{
    iCocosSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    item.image = image;
    return item;
}

/**
 *  使用DetailLabelColor初始化Cell
 *
 *  @param icon             图片
 *  @param title            标题
 *  @param type             类型
 *  @param desc             描述
 *  @param detailLabelColor 描述文字颜色
 *
 *  @return 对应的Cell模型
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type desc:(NSString *)desc detailLabelColor:(UIColor *)detailLabelColor
{
    iCocosSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    item.desc = desc;
    item.detailLabelColor = detailLabelColor;
    return item;
}


/**
 *  初始化Cell（设置描述文字颜色）
 */
+ (id)itemWithTitle:(NSString *)title type:(iCocosSettingItemType)type placeHolder:(NSString *)placeHolder
{
    iCocosSettingItem *item = [[self alloc] init];
    item.title = title;
    item.type = type;
    item.placeHolder = placeHolder;
    return item;
}



@end
