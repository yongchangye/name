//
//  ViewController3.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

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
    self.view.backgroundColor = [UIColor brownColor];
    //等待指示图  活动指示器  风火轮 菊花
    UIActivityIndicatorView * view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];//设置风格 (发白的 发灰)
    //下载数据需要等待时可以使用
    //刷新数据
    //不需要设置大小 位置有影响
    //常见控件 大部分都是大小没有影响 位置有影响
    view.center = self.view.center;
    //一般系统自带这些常用的空间 不需要改变大小
    //如果要想改变大小那么可以通过transform
    //放大3倍
    view.transform = CGAffineTransformMakeScale(3, 3);
    //改变圆圈颜色
    view.color = [UIColor redColor];
    
    [self.view addSubview:view];
    [view startAnimating];
    
    //要求3s之后  把放大视图 还原  并且这个过程产生一个动画效果  动画完成之后要把 等待视图关闭
    [self performSelector:@selector(click:) withObject:view afterDelay:2];
    [view release];
    //开启系统状态栏上自带的等待视图
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)click:(UIActivityIndicatorView *)sender{
    [UIView animateWithDuration:1 animations:^{
    sender.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {//动画完之后会回调这个block
        if ([sender isAnimating]) {
            [sender stopAnimating];//关闭等待视图
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
