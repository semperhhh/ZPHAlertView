//
//  ZPHAlertTextView.h
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/21.
//  Copyright © 2017年 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPHAlertTextView : UITextView
/**
 占位符
 */
@property (nonatomic,strong)UILabel *placeholderLabel;
/**
 占位符
 */
@property (nonatomic,strong)NSString *placeholder;
@end
