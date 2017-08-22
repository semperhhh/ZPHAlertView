//
//  ZPHalertView.h
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPHAlertHeader.h"

@interface ZPHAlertView : UIView

/**
 标题
 */
@property (nonatomic,strong)NSString *title;
/**
 内容
 */
@property (nonatomic,strong)NSString *message;
/**
 占位
 */
@property (nonatomic,strong)NSString *placeholder;

/**
 初始化
 */
-(instancetype)init;
/**
 初始化

 @param alertSize 尺寸
 */
-(instancetype)initWithalertViewSize:(CGSize)alertSize;
/**
 初始化
 
 @param title 标题内容
 @param message 文本内容
 */
-(instancetype)initWithalertViewTitle:(NSString *)title message:(NSString *)message;
/**
 初始化

 @param title 标题
 @param placeholder 输入框占位
 */
-(instancetype)initWithalertViewTitle:(NSString *)title textViewPlaceholder:(NSString *)placeholder;

//初始化 - 标题 尺寸 占位符
-(instancetype)initWithalertViewSize:(CGSize)alertSize title:(NSString *)title message:(NSString *)message;

//初始化 - 标题 文字 尺寸
-(instancetype)initWithalertViewSize:(CGSize)alertSize title:(NSString *)title placeholder:(NSString *)placeholder;
/**
 添加自定义按钮
 
 */
-(void)addButton:(UIButton *)button;

/**
 添加默认按钮

 @param title 文字
 @param handleBlock 回调
 */
-(void)addZPHAlertButtonWithTitle:(NSString *)title color:(ZPHButtonColor)buttonColor handle:(void(^)(UIButton *button))handleBlock;
/**
 移除视图
 */
-(void)dissView;
@end
