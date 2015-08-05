//
//  ViewController5.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

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
    
    
    //下载进度
    //进度条
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    //高度是固定的
    progressView.frame = CGRectMake(10, 100, 300, 30);
    //改变进度的值
    //progressView.progress = 0.5;
    //0---1  范围  1就是尽头
    //未完成部分的轨道颜色
    progressView.trackTintColor = [UIColor redColor];
    //设置完成部分轨道的颜色
    progressView.progressTintColor = [UIColor greenColor];
    
    //模拟 一个下载数据的过程
    //用定时器来模拟 下载完一个数据
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerClick:) userInfo:progressView repeats:YES];
    
    [self.view addSubview:progressView];
    [progressView release];

}
- (void)timerClick:(NSTimer *)timer{
    //timer.userInfo  可以接收 参数userInfo传入的内容
    UIProgressView *view = timer.userInfo;
    view.progress += 0.01;
    //。超过1之后 一直保持是1
    if (view.progress >= 1) {
        [timer invalidate];//如果进度满格之后 立即销毁定时器
    }
    NSLog(@"view.progress:%f",view.progress);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
