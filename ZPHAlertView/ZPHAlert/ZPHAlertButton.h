//
//  ZPHAlertButton.h
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/16.
//  Copyright © 2017年 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPHAlertButton : UIButton
/**
 按钮回调
 */
@property (nonatomic,copy)void(^alertButtonBlock)(UIButton *sender);
@end
