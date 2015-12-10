//
//  iCocosSettingItem.h
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//  一个Item对应一个Cell
// 用来描述当前cell里面显示的内容，描述点击cell后做什么事情

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, iCocosSettingItemType) {
    iCocosSettingItemTypeNone = 0, // 什么也没有
    iCocosSettingItemTypeArrow, // 箭头
    iCocosSettingItemTypeImage, //图片
    iCocosSettingItemTypeSwitch, // 开关
    iCocosSettingItemTypeTextField // 文本
};

@interface iCocosSettingItem : NSObject
/** 图片  */
@property (nonatomic, copy) UIImage *icon;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 描述 */
@property (nonatomic, copy) NSString *desc;
/** 占为文字 */
@property (nonatomic, copy) NSString *placeHolder;
/** 图片 */
@property (nonatomic, weak) UIImage *image;
/** 描述文字颜色 */
@property (nonatomic , strong) UIColor *detailLabelColor;

/** 类型 */
@property (nonatomic, assign) iCocosSettingItemType type;// Cell的样式
/** 点击Cell的操作 */
@property (nonatomic, copy) void (^operation)() ; // 点击cell后要执行的操作


/**
 *  舒适化Cell
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type desc:(NSString *)desc;

/**
 *  初始化Cell（设置描述文字颜色）
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type desc:(NSString *)desc detailLabelColor:(UIColor *)detailLabelColor;

/**
 *  初始化Cell（设置描述文字颜色）
 */
+ (id)itemWithTitle:(NSString *)title type:(iCocosSettingItemType)type placeHolder:(NSString *)placeHolder;

/**
 *  初始化Cell
 */
+ (id)itemWithImage:(UIImage *)icon title:(NSString *)title type:(iCocosSettingItemType)type image:(UIImage *)image;

@end
