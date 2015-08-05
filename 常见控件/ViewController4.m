//
//  ViewController4.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

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
    self.view.backgroundColor = [UIColor yellowColor];
    //滑块
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 250, 260, 30)];
    //设置最小值
    slider.minimumValue = 0.0;//默认就是0
    //设置最大值
    slider.maximumValue = 100.0;//默认是1
    //设置默认值/初始值
    slider.value = 50;
    //slider的值是否伴随手指点击滑块之后 实时发送连续的变化
    slider.continuous = YES;//默认是YES
    //如果是NO只有手指点击滑块停下来的时候才会 触发函数得到内容
    //可以根据value 和最大值 最小值可以算数比例
    //(slider.value -slider.minimumValue)/(slider.maximumValue-slider.minimumValue)
    //设置轨道颜色 靠近最小值的
    slider.minimumTrackTintColor = [UIColor redColor];
    //设置靠近最大值的轨道颜色
    slider.maximumTrackTintColor = [UIColor blueColor];
    //设置滑块颜色iOS7 无效果  iOS7之前可以
    //slider.thumbTintColor = [UIColor blueColor];
    //设置滑块图片
    [slider setThumbImage:[UIImage imageNamed:@"002"] forState:UIControlStateNormal];
    //设置左侧图片
    slider.minimumValueImage = [UIImage imageNamed:@"003"];
    //设置右侧图片
    slider.maximumValueImage = [UIImage imageNamed:@"002"];
    //设置旋转
    slider.transform = CGAffineTransformMakeRotation(M_PI/2);//以中心点位置旋转 90°
    
    
    //增加事件
    //一旦用手指点击滑块滑动的时候会改变值 这时会触发self 调用sliderClick:
    
    [slider addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    [slider release];
    //可以用于 调节音量
    
    
}
- (void)sliderClick:(UISlider *)slider{
    NSLog(@"值被改了value:%f",slider.value);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
