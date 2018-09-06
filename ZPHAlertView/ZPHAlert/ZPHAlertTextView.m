//
//  ZPHAlertTextView.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/21.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertTextView.h"

@interface ZPHAlertTextView ()
@end

@implementation ZPHAlertTextView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 20)];
        _placeholderLabel.font = [UIFont systemFontOfSize:14];
        _placeholderLabel.textColor = [UIColor grayColor];
        [self addSubview:_placeholderLabel];
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    
    _placeholderLabel.text = placeholder;
}

@end
