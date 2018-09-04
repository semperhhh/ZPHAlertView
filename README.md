# ZPHAlertView

> 一个简单的提示框,会持续更新,让提示框更加易用

* 添加了输入框textview,可以选择输入框和文本内容两种形式;
* 添加了图片类型Alert; -09-04

### 文字类型

~~~~objective-c
ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"title test" message:@"message test"];
[alert addZPHAlertButtonWithTitle:@"test1" color:ZPHButtonColorGreen handle:nil];//添加按钮
[alert addZPHAlertButtonWithTitle:@"test2" color:ZPHButtonColorYellow handle:nil];

[alert showView];//展示
~~~~

### 图片类型

~~~~objective-c
ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"title Test" image:[UIImage imageNamed:@"timg"]];     

[alert showView];//展示
~~~~

### 文本框类型

~~~~objective-c
ZPHAlertView *alert = [[ZPHAlertView alloc]initWithalertViewTitle:@"place" textViewPlaceholder:@"test"]; 

[alert showView];//展示
~~~~



