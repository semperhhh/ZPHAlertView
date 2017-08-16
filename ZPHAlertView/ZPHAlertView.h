//
//  ZPHAlartView.h
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPHAlertView : UIView
/**
 初始化
 
 @param title 标题内容
 @param message 文本内容
 */
-(instancetype)initWithAlartViewTitle:(NSString *)title message:(NSString *)message;
/**
 初始化

 @param alertSize 提示框尺寸
 @param title 标题内容
 @param message 文本内容
 */
-(instancetype)initWithAlartViewSize:(CGSize)alertSize title:(NSString *)title message:(NSString *)message;
/**
 添加自定义按钮
 
 */
-(void)addButton:(UIButton *)button;

/**
 添加默认按钮

 @param title 文字
 @param handleBlock 回调
 */
-(void)addZPHAlertButtonWithTitle:(NSString *)title handle:(void(^)(UIButton *button))handleBlock;
/**
 移除视图
 */
-(void)dissView;
@end
