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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _showButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _showButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_showButton];
    [_showButton setTitle:@"show" forState:UIControlStateNormal];
    [_showButton addTarget:self action:@selector(showButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showButtonClick:(UIButton *)button {
    
    ZPHAlertView *alert = [[ZPHAlertView alloc]initWithAlartView];
    [self.view addSubview:alert];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
