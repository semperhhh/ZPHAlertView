//
//  ZPHAlartView.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertView.h"
#import "ZPHAlertAction.h"

@interface ZPHAlertView ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong)ZPHAlertAction *alertView;
@end
@implementation ZPHAlertView

-(instancetype)initWithAlartView {
    
    return [self initWithAlartViewSize:CGSizeMake(200, 150)];
}

-(instancetype)initWithAlartViewSize:(CGSize)alertSize {
    
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];//透明
        [self setupAlert:alertSize];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

//点击代理
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isEqual:_alertView]) {
        
        return NO;
    }
    
    return YES;
}

-(void)tapAction {
    
    [self dissView];
}

-(void)dissView {
    
    [self removeFromSuperview];
}

-(void)setupAlert:(CGSize)alertSize{
    
    _alertView = [[ZPHAlertAction alloc]initWithFrame:CGRectMake(self.frame.size.width /2 -alertSize.width/2, self.frame.size.height/2 -alertSize.height/2, alertSize.width, alertSize.height)];
    [self addSubview:self.alertView];
}

@end
