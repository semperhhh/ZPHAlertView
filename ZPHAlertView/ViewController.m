//
//  ViewController.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/7.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ViewController.h"
#import "ZPHAlertView.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *showButton;
@property (nonatomic,strong)ZPHAlertView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _showButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _showButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_showButton];
    [_showButton setTitle:@"show" forState:UIControlStateNormal];
    [_showButton addTarget:self action:@selector(showButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showButtonClick:(UIButton *)button {
    
    ZPHAlertView *alert = [[ZPHAlertView alloc]initWithAlartViewTitle:@"title test" message:nil];
    _alertView = alert;
    
    UIButton *alert1 = [[UIButton alloc]init];
    alert1.backgroundColor = [UIColor greenColor];
    [alert1 setTitle:@"test1" forState:UIControlStateNormal];
    [alert1 addTarget:self action:@selector(alert1Action) forControlEvents:UIControlEventTouchUpInside];
    [alert addButton:alert1];
    
    [alert addZPHAlertButtonWithTitle:@"test2" handle:^(UIButton *button) {
        
        NSLog(@"test2");
    }];
}

-(void)alert1Action {
    
    NSLog(@"test1");
    [_alertView dissView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
