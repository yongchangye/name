//
//  ViewController10.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController10.h"

@interface ViewController10 ()

@end

@implementation ViewController10

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
    //文本可编辑
    UITextView *textView= [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 320, 150)];
    textView.text = @"welcome to beijinghello  xiaohong welcome to beijinghello  xiaohongwelcome to beijing hello  xiaohong welcome to beijing hello  xiaohongwelcome to beijing hello  xiaohong welcome to beijinghello  xiaohong ";
    textView.font = [UIFont  systemFontOfSize:30];
    textView.textColor = [UIColor redColor];
    textView.backgroundColor = [UIColor orangeColor];
    //可以进行编辑
    textView.editable = YES;//默认YES  NO 不能编辑
    
    //还可以滚动
    textView.scrollEnabled = YES;//NO不能滚动 默认是YES
    //这里的return 表示换行
    //可以设置代理
    textView.delegate = self;
    

    [self.view addSubview:textView];
    [textView release];
}
#pragma mark - 协议中的方法
//是否可以进入编辑模式
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"是否可以进入编辑模式");
    return YES;//YES可以进入编辑模式
}
//已经进入编辑模式调用
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"已经进入编辑模式");
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"是否可以结束编辑模式");
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"已经结束编辑模式");
}
//当textView的内容已经发生改变的时候调用
- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"textViewDidChangetextView的内容已经发生改变");
}
//一旦触摸textView就会调用
- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"textViewDidChangeSelection触摸了textView");
}
//一旦输入内容就会调用 返回YES 可以把输入的text 写入textView
//是否可以把输入的内容写入textView
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    //range就是光标的位置
    NSLog(@"range:%@",NSStringFromRange(range));
    //text 将要输入到textView的内容
    NSLog(@"text:%@",text);
    return YES;//YES表示的是可以把text输入到textView NO：表示不可以
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
