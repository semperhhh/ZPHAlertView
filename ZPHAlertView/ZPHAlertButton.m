//
//  ZPHAlertButton.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/16.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ZPHAlertButton.h"

@implementation ZPHAlertButton

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.layer setBorderWidth:0.5];
        [self.layer setMasksToBounds:YES];
    }
    
    return self;
}
@end
