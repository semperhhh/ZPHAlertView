//
//  ZPHAlertAction.h
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPHAlertHeader.h"

@protocol ZPHAlertActionDelegate <NSObject>

@optional
-(void)zphAlertAcitionDiss;
@end

@interface ZPHAlertAction : UIView
@property (nonatomic,weak)id<ZPHAlertActionDelegate> delegate;
/**
 标题文本
 */
@property (nonatomic,strong)NSString *title;
/**
 内容文本
 */
@property (nonatomic,strong)NSString *message;
/**
 输入框占位符
 */
@property (nonatomic,strong)NSString *placeholder;
/**
 图片
 */
@property (nonatomic,strong)UIImage *image;
/**
 添加自定义按钮
 */
-(void)addButton:(UIButton *)button;
/**
 添加默认按钮

 @param title 文字
 @param buttonColor 按钮颜色
 @param handleBlock 回调
 */
-(void)addZPHAlertButtonWithTitle:(NSString *)title color:(ZPHButtonColor)buttonColor handle:(void(^)(UIButton *button))handleBlock;
@end
