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

 */
-(instancetype)initWithAlartView;
/**
 初始化

 @param alertSize 提示框尺寸
 */
-(instancetype)initWithAlartViewSize:(CGSize)alertSize;
@end
