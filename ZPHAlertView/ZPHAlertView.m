//
//  ZPHAlartView.m
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

-(instancetype)initWithAlartViewTitle:(NSString *)title message:(NSString *)message{
    
    return [self initWithAlartViewSize:CGSizeMake(200, 150) title:title message:message];
}

-(instancetype)initWithAlartViewSize:(CGSize)alertSize title:(NSString *)title message:(NSString *)message{
    
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];//透明
        
        [self setupAlert:alertSize title:title message:message];//显示框
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
    
    return self;
}

//添加默认按钮
-(void)addZPHAlertButtonWithTitle:(NSString *)title handle:(void(^)(UIButton *button))handleBlock {
    
    [self.alertView addZPHAlertButtonWithTitle:title handle:handleBlock];
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

-(void)setupAlert:(CGSize)alertSize title:(NSString *)title message:(NSString *)message{
    
    _alertView = [[ZPHAlertAction alloc]initWithFrame:CGRectMake(self.frame.size.width /2 -alertSize.width/2, self.frame.size.height/2 -alertSize.height/2, alertSize.width, alertSize.height)];
    _alertView.delegate = self;
    _alertView.title = title;
    _alertView.message = message;
    [self addSubview:self.alertView];
}

#pragma mark --ZPHAlertActionDelegate
-(void)zphAlertAcitionDiss {
    
    [self dissView];
}

@end
