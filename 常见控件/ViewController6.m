//
//  ViewController6.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

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
    
    NSArray * titles = @[@"小红",@"小黄"];

    //分段控制器
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:titles];
    
    seg.frame = CGRectMake(50, 100, 200, 50);
    //默认段与段之间均匀分布
    //增加事件
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    //设置默认选中哪一段
    //seg.selectedSegmentIndex = 0;
    
    
    [self.view addSubview:seg];
    [seg release];
}
- (void)segClick:(UISegmentedControl *)seg{
    //获取被点击的那一段
    NSLog(@"index:%d",seg.selectedSegmentIndex);
    
    NSLog(@"title:%@",[seg titleForSegmentAtIndex:seg.selectedSegmentIndex]);//打印被选中段的标题
    if (seg.numberOfSegments < 3) {//numberOfSegments获取有多少段
        //在指定位置插入一段
#if 0
        [seg insertSegmentWithTitle:@"小粉" atIndex:1 animated:YES];
#else
        //插入带的图片的
        //分段控制器默认会把插入的图片给改为蓝色的
        //那么iOS7 需要设置图片为总是原生态的图片
        UIImage * image = [[UIImage imageNamed:@"002"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [seg insertSegmentWithImage: image atIndex:1 animated:YES];
#endif
        //把指定段禁用
        [seg setEnabled:NO forSegmentAtIndex:0];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
