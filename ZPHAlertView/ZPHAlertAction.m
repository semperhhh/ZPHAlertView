//
//  ZPHAlertAction.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertAction.h"
#import "ZPHAlertButton.h"

@interface ZPHAlertAction ()
/**
 标题
 */
@property (nonatomic,strong)UILabel *alertTitleLabel;
/**
 内容
 */
@property (nonatomic,strong)UILabel *messageLabel;
/**
 子控件按钮数组
 */
@property (nonatomic,strong)NSMutableArray *buttonArray;
@property (nonatomic,strong)void(^actionBlock)(UIButton *button);
@end

@implementation ZPHAlertAction

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.alertTitleLabel];
    }
    
    return self;
}

-(void)addButton:(UIButton *)button {

    [self.buttonArray addObject:button];
    [self setupUI];
    [self addSubview:button];
}

//标题赋值
-(void)setTitle:(NSString *)title {

    _title = title;
    
    if (title.length != 0) {
        
        _alertTitleLabel.text = title;
    }
}

//文本内容赋值
-(void)setMessage:(NSString *)message {
    
    _message = message;
    
    if (message) {
        
        [self addSubview:self.messageLabel];
        self.messageLabel.text = message;
    }
}

-(void)addZPHAlertButtonWithTitle:(NSString *)title handle:(void(^)(UIButton *button))handleBlock {
    
    ZPHAlertButton *button = [[ZPHAlertButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.alertButtonBlock = handleBlock;
    [self.buttonArray addObject:button];
    [self setupUI];
    [self addSubview:button];
}

//按钮点击事件
-(void)buttonAction:(ZPHAlertButton *)sender {
    
    NSLog(@"zphbutton");
    
    if (sender.alertButtonBlock) {
        sender.alertButtonBlock(sender);
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(zphAlertAcitionDiss)]) {
        [self.delegate zphAlertAcitionDiss];
    }
}

//按钮位置
-(void)setupUI {
    
    switch (self.buttonArray.count) {
            
        case 1:
        case 2: {
            
            [self.buttonArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
                
                button.frame = CGRectMake(idx *self.bounds.size.width/2, self.frame.size.height -30, self.bounds.size.width /self.buttonArray.count, 30);
            }];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark --lazy loading
-(UILabel *)alertTitleLabel {   //标题
    
    if (!_alertTitleLabel) {
        _alertTitleLabel = [[UILabel alloc]init];
        _alertTitleLabel.backgroundColor = [UIColor whiteColor];
        _alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        _alertTitleLabel.font = [UIFont systemFontOfSize:20.0 weight:10.0];
        _alertTitleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    }
    return _alertTitleLabel;
}

-(UILabel *)messageLabel {
    
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.backgroundColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.frame = CGRectMake(0, CGRectGetMaxY(self.alertTitleLabel.frame) +5, self.frame.size.width, self.frame.size.height - self.alertTitleLabel.frame.size.height -5 - 30 - 5);
    }
    return _messageLabel;
}

-(NSMutableArray *)buttonArray {
    
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

@end
