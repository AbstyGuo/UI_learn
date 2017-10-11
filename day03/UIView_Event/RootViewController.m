//
//  RootViewController.m
//  UIView_Event
//
//  Created by student on 15-11-18.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    //创建视图
	UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 200)];
    view.backgroundColor =[UIColor yellowColor];
    [self.view addSubview:view];
    
    UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 50)];
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button];
    //把button添加到view上，view是button的父视图
    //1、如果父视图不响应用户事件，子视图也不响应
    //UIImageView和UILable默认是不响应用户事件的
    //设置响应用户事件
    view.userInteractionEnabled = YES;
    //移动button，让它的一部分超出父视图边界
    //2、子视图超出父视图的部分是不响应用户事件的
    button.center = CGPointZero;
    button.center = CGPointMake(100, 100);
    
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 100, 50)];
    button1.backgroundColor = [UIColor magentaColor];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button1 setTitle:@"新按钮" forState:UIControlStateNormal];
    button1.center = CGPointMake(50, 75);
    [view addSubview:button1];
    //3、同父视图上两个子视图交叠的情况，事件从上层向下传递，一旦有一层视图响应，则事件被截断，停止向下传递
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
