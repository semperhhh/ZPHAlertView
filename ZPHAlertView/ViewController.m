//
//  ViewController.m
//  ZPHAlertView
//
//  Created by 张鹏辉 on 2017/8/7.
//  Copyright © 2017年 zph. All rights reserved.
//

#import "ViewController.h"
#import "ZPHAlertView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UIButton *showButton;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark --UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, cell.contentView.frame.size.width -20, cell.contentView.frame.size.height)];
    [cell.contentView addSubview:label];
    switch (indexPath.row) {
        case 0: {
            label.text = @"text";
        }
            break;
        case 1: {
            label.text = @"picture";
        }
            break;
        case 2: {
            label.text = @"place";
        }
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {//text
            
            ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"title test" message:@"message test"];
            
            [alert addZPHAlertButtonWithTitle:@"test1" color:ZPHButtonColorGreen handle:^(UIButton *button) {
                
                NSLog(@"test1");
            }];
            
            [alert addZPHAlertButtonWithTitle:@"test2" color:ZPHButtonColorYellow handle:^(UIButton *button) {
                
                NSLog(@"test2");
            }];
            
            [alert showView];
        }
            break;
            
        case 1: {//picture
            
            ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"title Test" image:[UIImage imageNamed:@"timg"]];
            
            [alert showView];
        }
            break;
            
        case 2: {//place
            
            ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"place" textViewPlaceholder:@"test"];
            [alert addZPHAlertButtonWithTitle:@"yes" color:ZPHButtonColorGray handle:^(UIButton *button) {
                NSLog(@"yes");
            }];
            
            [alert showView];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
