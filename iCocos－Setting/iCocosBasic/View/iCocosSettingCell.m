//
//  iCocosSettingself.m
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 iCocos. All rights reserved.
//

#import "iCocosSettingCell.h"
#import "iCocosSettingItem.h"

#import "UIView+Extension.h"

@interface iCocosSettingCell()<UITextFieldDelegate>
{
    UIImageView *_arrow;
    UISwitch *_switch;
    UITextField *_textField;
    UIImageView *_imageView;
}

@property (nonatomic, weak) UIView *sepView;


@end

@implementation iCocosSettingCell

+ (id)settingCellWithTableView:(UITableView *)tableView
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *ID = @"Cell";
    
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    iCocosSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[iCocosSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//        cell.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *sepView = [[UIView alloc] init];
        sepView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        self.sepView = sepView;
        [self.contentView addSubview:sepView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.sepView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.8);
}

- (void)setItem:(iCocosSettingItem *)item
{
    _item = item;
    
    // 设置数据
    self.imageView.image = item.icon;
    
    self.textLabel.text = item.title;
    self.textLabel.font = [UIFont systemFontOfSize:13];
    self.detailTextLabel.text = item.desc;
    self.detailTextLabel.textColor = item.detailLabelColor;
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
    if (item.type == iCocosSettingItemTypeArrow) {
        
        if (_arrow == nil) {
            _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"detail_good_right"]];
        }
        
        // 右边显示箭头
        self.accessoryView = _arrow;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if (item.type == iCocosSettingItemTypeSwitch) {
        
        if (_switch == nil) {
            _switch = [[UISwitch alloc] init];
            _switch.on = YES;
            [_switch addTarget:self action:@selector(settingSwitchClick) forControlEvents:UIControlEventValueChanged];
        }
        
        // 右边显示开关
        self.accessoryView = _switch;
        // 禁止选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if (item.type == iCocosSettingItemTypeTextField) {
        
        if (_textField == nil) {
            _textField = [[UITextField alloc] init];
            _textField.height = self.frame.size.height;
            _textField.placeholder = item.placeHolder;
            _textField.font = [UIFont systemFontOfSize:13];
            _textField.width = 200;
            _textField.x = [UIScreen mainScreen].bounds.size.width - 210;
            _textField.delegate = self;
            
            _textField.textAlignment = NSTextAlignmentRight;
            
        }
        
        // 右边显示开关
        self.accessoryView = _textField;
        // 禁止选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if (item.type == iCocosSettingItemTypeImage) {
        
        if (_textField == nil) {
            _imageView = [[UIImageView alloc] init];
            _imageView.image = item.image;
            _imageView.width = 100;
        }
        
        // 右边显示开关
        self.accessoryView = _imageView;
        // 禁止选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else {
        
        // 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
}

- (void)settingSwitchClick
{
    NSLog(@"%s", __func__);
}


@end
