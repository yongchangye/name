//
//  ViewController9.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController9.h"
#import "MyControl.h"
@interface ViewController9 ()

@end

@implementation ViewController9

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
    
    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(110,100 , 100, 50) title:@"分享" target:self action:@selector(btnClick) tag:10001];
    [self.view addSubview:button];
    

    
}
- (void)btnClick{

    //操作表单
    //动作表单
    
    //要想处理按钮按钮事件要遵守协议设置代理
    //destructiveButtonTitle :一般 当点击一个按钮如果很危险 按钮直接 设置到destructiveButtonTitle:  这个标题显示红色
     UIActionSheet *act = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"人人分享",@"新浪微博",@"QQ分享",@"网易分享",@"搜狐分享", nil];
    
    //从哪个视图弹出
    //从导航的view上弹出 或者从 导航所在window上弹出
    [act showInView:self.navigationController.view];
    
    [act release];
    //这个和UIAlertView 很像  这里一般可以设置多个按钮
}


#pragma mark - 协议中的方法
//最常用的方法  一旦点击按钮 就会触发

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //从第一个按钮开始  索引0开始
    
    NSLog(@"index:%d",buttonIndex);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
