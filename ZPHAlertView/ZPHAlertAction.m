//
//  ZPHAlertAction.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertAction.h"
#import "ZPHAlertButton.h"
#import "ZPHAlertTextView.h"

@interface ZPHAlertAction ()<UITextViewDelegate>
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
/**
 输入框
 */
@property (nonatomic,strong)ZPHAlertTextView *textView;

@end

@implementation ZPHAlertAction

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
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
        
        [self addSubview:self.alertTitleLabel];
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

//占位符赋值
-(void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    
    if (placeholder) {
        
        [self addSubview:self.textView];
        self.textView.placeholder = placeholder;
    }
}

-(void)addZPHAlertButtonWithTitle:(NSString *)title color:(ZPHButtonColor)buttonColor handle:(void(^)(UIButton *button))handleBlock {
    
    ZPHAlertButton *button = [[ZPHAlertButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    switch (buttonColor) {
        case ZPHButtonColorYellow:
            [button setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:220.0/255.0 blue:82.0/255.0 alpha:1.0]];
            break;
        case ZPHButtonColorGreen:
            [button setBackgroundColor:[UIColor colorWithRed:80.0/255.0 green:190.0/255.0 blue:120.0/255.0 alpha:1.0]];
            break;
        case ZPHButtonColorGray:
        default:
            [button setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
            break;
    }

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
                
                button.frame = CGRectMake(idx *self.bounds.size.width/2, self.frame.size.height -50, self.bounds.size.width /self.buttonArray.count, 50);
            }];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark --UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView {
    
    self.textView.placeholderLabel.alpha = 0;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    
    if (self.textView.text.length == 0) {
        
        self.textView.placeholderLabel.alpha = 1;
    }
}

#pragma mark --lazy loading
-(UILabel *)alertTitleLabel {   //标题
    
    if (!_alertTitleLabel) {
        _alertTitleLabel = [[UILabel alloc]init];
        _alertTitleLabel.backgroundColor = [UIColor whiteColor];
        _alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        _alertTitleLabel.font = [UIFont systemFontOfSize:20.0 weight:0.2];
        _alertTitleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 40);
    }
    return _alertTitleLabel;
}

-(UILabel *)messageLabel {
    
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.backgroundColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.frame = CGRectMake(0, CGRectGetMaxY(self.alertTitleLabel.frame) +5, self.frame.size.width, self.frame.size.height - self.alertTitleLabel.frame.size.height -5 - 50 - 5);
    }
    return _messageLabel;
}

-(NSMutableArray *)buttonArray {
    
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

-(UITextView *)textView {
    
    if (!_textView) {
        _textView = [[ZPHAlertTextView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.alertTitleLabel.frame) +5, self.frame.size.width -20, self.frame.size.height - self.alertTitleLabel.frame.size.height -5 - 30 - 5)];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.delegate = self;
    }
    return _textView;
}

@end
