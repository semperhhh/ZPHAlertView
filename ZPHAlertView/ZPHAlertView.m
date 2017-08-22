//
//  ZPHalertView.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertView.h"
#import "ZPHAlertAction.h"

@interface ZPHAlertView ()<UIGestureRecognizerDelegate,ZPHAlertActionDelegate>
@property (nonatomic,strong)ZPHAlertAction *alertView;
@end
@implementation ZPHAlertView

//初始化
-(instancetype)init {
    
    return [self initWithalertViewTitle:nil message:nil];
}

//初始化 - 尺寸
-(instancetype)initWithalertViewSize:(CGSize)alertSize {
    
    return [self initWithalertViewSize:alertSize title:nil message:nil placeholder:nil];
}

//初始化 - 标题 输入框
-(instancetype)initWithalertViewTitle:(NSString *)title textViewPlaceholder:(NSString *)placeholder {
    
    return [self initWithalertViewSize:CGSizeMake(250, 200) title:title message:nil placeholder:placeholder];
}

//初始化 - 标题 文字
-(instancetype)initWithalertViewTitle:(NSString *)title message:(NSString *)message {
    
    return [self initWithalertViewSize:CGSizeMake(200, 150) title:title message:message placeholder:nil];
}

//初始化 - 标题 尺寸 占位符
-(instancetype)initWithalertViewSize:(CGSize)alertSize title:(NSString *)title message:(NSString *)message {
    
    return [self initWithalertViewSize:alertSize title:title message:message placeholder:nil];
}

//初始化 - 标题 文字 尺寸
-(instancetype)initWithalertViewSize:(CGSize)alertSize title:(NSString *)title placeholder:(NSString *)placeholder {
    
    return [self initWithalertViewSize:alertSize title:title message:nil placeholder:placeholder];
}

//初始化 - 标题 文字 尺寸 占位符
-(instancetype)initWithalertViewSize:(CGSize)alertSize title:(NSString *)title message:(NSString *)message placeholder:(NSString *)placeholder {
    
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];//透明
        
        [self setupAlert:alertSize title:title message:message placeholder:placeholder];//显示框
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];  //点击手势
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
    
    return self;
}

//添加默认按钮
-(void)addZPHAlertButtonWithTitle:(NSString *)title color:(ZPHButtonColor)buttonColor handle:(void(^)(UIButton *button))handleBlock {
    
    [self.alertView addZPHAlertButtonWithTitle:title color:buttonColor handle:handleBlock];
}


//添加自定义按钮
-(void)addButton:(UIButton *)button{
    
    [self.alertView addButton:button];
}

//点击代理
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isEqual:self]) {
        return YES;
    }
    return NO;
}

-(void)tapAction {
    
    [self dissView];
}

//移除视图
-(void)dissView {
    
    [self removeFromSuperview];
}

/**
 添加

 @param alertSize 尺寸
 @param title 标题
 @param message 内容
 @param placeholder 占位符
 */
-(void)setupAlert:(CGSize)alertSize title:(NSString *)title message:(NSString *)message placeholder:(NSString *)placeholder {
    
    _alertView = [[ZPHAlertAction alloc]initWithFrame:CGRectMake(self.frame.size.width /2 -alertSize.width/2, self.frame.size.height/2 -alertSize.height/2, alertSize.width, alertSize.height)];
    _alertView.delegate = self;
    _alertView.title = title;
    _alertView.message = message;
    _alertView.placeholder = placeholder;
    _alertView.layer.cornerRadius = 5;
    _alertView.layer.masksToBounds = YES;
    [self addSubview:self.alertView];
}

-(void)setTitle:(NSString *)title {
    
    _title = title;
    self.alertView.title = title;
}

-(void)setMessage:(NSString *)message {
    
    _message = message;
    self.alertView.message = message;
}

-(void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    self.alertView.placeholder = placeholder;
}

#pragma mark --ZPHAlertActionDelegate
-(void)zphAlertAcitionDiss {
    
    [self dissView];
}

@end
