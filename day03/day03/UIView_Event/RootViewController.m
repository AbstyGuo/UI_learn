//
//  RootViewController.m
//  UIView_Event
//
//  Created by 夏婷 on 15/11/18.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建视图
    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 200)];
    
    view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 50)];
    button.backgroundColor = [UIColor cyanColor];
    
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button];
    //把button添加到view，view是button的父视图
    
    //*1.如果父视图，不响应用户事件，子视图也不响应
    
    //UIImageView和UILbel默认是不响应用户事件的
    //设置响应用户事件
    view.userInteractionEnabled = YES;
    
    //移动button,让它的一部分超出父视图边界
    button.center = CGPointZero;
    
    //*2.子视图超出父视图的部分是不响应用户事件的
    
//    self.view.userInteractionEnabled = NO;
    
    //再一次改变button的位置
    button.center = CGPointMake(100, 100);
    
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 100, 50)];
    button1.backgroundColor = [UIColor magentaColor];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button1 setTitle:@"新按钮" forState:UIControlStateNormal];
    button1.center = CGPointMake(50, 75);
    [view addSubview:button1];
    
    //*3同父视图上两个子视图就交叠的情况，事件从上层往底层传递，传递过程中，一旦有视图响应了用户事件，事件就被截断，不再继续往下传递
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
