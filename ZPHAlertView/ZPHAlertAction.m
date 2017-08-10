//
//  ZPHAlertAction.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/8.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertAction.h"

@interface ZPHAlertAction ()
/**
 按钮
 */
@property (nonatomic,strong)UIButton *firstButton;
@property (nonatomic,strong)UIButton *secondButton;
@property (nonatomic,strong)UILabel *alertTitleLabel;
@end

@implementation ZPHAlertAction

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

-(UILabel *)alertTitleLabel {
    
    if (!_alertTitleLabel) {
        
        _alertTitleLabel = [[UILabel alloc]init];
        _alertTitleLabel.backgroundColor = [UIColor grayColor];
    }
    
    return _alertTitleLabel;
}

@end
