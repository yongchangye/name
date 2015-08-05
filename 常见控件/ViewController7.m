//
//  ViewController7.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()

@end

@implementation ViewController7

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
    //计步器/ 步进器
    
    UIStepper *step = [[UIStepper alloc] init];
    
    step.center  = self.view.center;
    //设置最小值 默认是0
    step.minimumValue = 0.0;
    //设置 +之后的最大值 默认是100
    step.maximumValue = 1000;
    //设置步长(点击一次的大小)
    step.stepValue = 100;
    //设置默认值的大小
    //step.value = 500;
    //如果到达最小值 那么-不能点 到达最大值+不能点
    //设置长按之后是否可以实时连续 更改数据
    step.continuous = YES;
    //设置是否可以长按（长时间按着）
    step.autorepeat = NO;//NO 表示长按之后只生效一次
    
    //添加事件
    [step addTarget:self action:@selector(stepClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:step];
    [step release];
}
- (void)stepClick:(UIStepper *)step{
    NSLog(@"value:%f",step.value);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
