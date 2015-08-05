//
//  ViewController8.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255/255.0) green:(arc4random()%255/255.0) blue:(arc4random()%255/255.0) alpha:1];
    //iOS7之前 UIAlertView 是可以在上面添加自定义的视图(可以定制) iOS7之后就不能了
    
    //如果要想接收按钮的点击那么必须要遵守协议设置代理
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"ATM机5s之后就爆炸\n请尽快登陆取钱" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //不同的AlertView类型
    //弹出一个自带文本输入框的
    //UIAlertViewStylePlainTextInput 自带 文本输入框
    //UIAlertViewStyleSecureTextInput密文的
//    UIAlertViewStyleDefault默认的
    //UIAlertViewStyleLoginAndPasswordInput带登陆注册的
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
    //5s之后调用 self  click
    [self performSelector:@selector(click:) withObject:alertView afterDelay:5];
    
    [alertView release];
}

- (void)click:(UIAlertView *)view{
    //不用点击按钮 通过代码 自动关闭AlertView
    [view dismissWithClickedButtonIndex:0 animated:YES];//关闭 AlertView
}
#pragma mark - UIAlertViewDelegate协议中的方法
//点击alertview上的按钮 触发的函数
//最常用的方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"index:%d",buttonIndex);
    //索引从0 开始  一般取消按钮默认是0  其他按钮从1开始
    //判断是否是登陆注册的AlertView
    if (alertView.alertViewStyle == UIAlertViewStyleLoginAndPasswordInput ) {
        UITextField *login = [alertView textFieldAtIndex:0];
        NSLog(@"账户:%@",login.text);
        UITextField *pass = [alertView textFieldAtIndex:1];
        NSLog(@"密码:%@",pass.text);
    }
    
    if (alertView.cancelButtonIndex == buttonIndex) {
        NSLog(@"取消");
    }else{
        NSLog(@"确定");
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
