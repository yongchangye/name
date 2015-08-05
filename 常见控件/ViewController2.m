//
//  ViewController2.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

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
    self.view.backgroundColor = [UIColor cyanColor];
    //开关按钮
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    
    //UIControlEventValueChanged被触发的事件
    //增加触发事件  一旦 开关按钮的值被改变就会让self 调用switchClick:
    [sw addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    //设置 开关开启之后的色调
    sw.onTintColor = [UIColor orangeColor];
    //设置关闭的颜色 效果不明显 只有边框有颜色
    sw.tintColor = [UIColor redColor];
    //设置 开关的初始状态
    sw.on = NO;//通过代码修改开关状态是不会触发事件的所有的 能够触发事件的控件  必须和人之间有接触才能被触发
    
    //修改小圆圈的颜色
    sw.thumbTintColor = [UIColor blueColor];
    //执行选择器对应的方法
    //5s 之后  让self  执行 click
    //一旦执行下面代码 就会启动一个子线程 5s 之后执行[self click:sw];
    [self performSelector:@selector(click:) withObject:sw afterDelay:2];
    [self.view addSubview:sw];
    [sw release];
}

- (void)click:(UISwitch *)sw{
    [sw setOn:YES animated:YES];//代码修改状态不会触发事件
    //下面不带动画
    //sw.on = YES;
}

- (void)switchClick:(UISwitch *)sw{
    if (sw.isOn) {
        NSLog(@"开启状态");
    }else{
        NSLog(@"关闭状态");
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
