//
//  ViewController1.m
//  常见控件
//
//  Created by LZXuan on 14-5-16.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ViewController1.h"
#import "MyControl.h"
@interface ViewController1 ()
{
    NSArray *_className;
}
@end

@implementation ViewController1
- (void)dealloc{
    [_className release];
    [super dealloc];
}
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
    self.view.backgroundColor = [UIColor grayColor];
    NSArray *titles = @[@"UISwitch",@"UIActivityIndicatorView",@"UISlider",@"UIProcessView",@"UISegmentedControl",@"UIStepper",@"UIAlertView",@"UIActionSheet",@"UITextView"];
    //把一些视图控制器的类名字符串保存在数组中
    
    _className = [[NSArray alloc] initWithObjects:@"ViewController2",@"ViewController3",@"ViewController4",@"ViewController5",@"ViewController6",@"ViewController7",@"ViewController8",@"ViewController9",@"ViewController10", nil];
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * button = [MyControl creatButtonWithFrame:CGRectMake(10, 70+40*i, 300, 30) title:titles[i] target:self action:@selector(btnClick:) tag:101+i];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //改为圆角
        button.layer.cornerRadius = 5;
        
        [self.view addSubview:button];
    }
    
}
- (void)btnClick:(UIButton *)button{
    NSString *className = _className[button.tag-101];
    //把一个类名字符串转化为 Class  类的类型
    //比如:@"ViewContoller2" 那么这里就可以获取ViewContoller2类
    Class cls = NSClassFromString(className);
    //cls可以执行 ViewContoller2类的所有操作 比如创建对象
    //创建 ViewContoller2 类的实例
    UIViewController *viewController = [[cls alloc] init];
    //设置标题
    viewController.title = button.currentTitle;
    //翻转
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
