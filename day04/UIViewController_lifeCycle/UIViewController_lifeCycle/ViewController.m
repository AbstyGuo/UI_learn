//
//  ViewController.m
//  UIViewController_lifeCycle
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import  "MyHeaderFile.h"

#import "UIView+TransitionAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    SHOW_FUNC
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // NSLog(@"%s",__func__);__func__  C函数，作用返回当前函数的名字char *
    
    //创建一个按钮，点击按钮时，进入下一个界面
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 50)];
    [button setTitle:@"进入下一个界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    SHOW_FUNC;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    SHOW_FUNC;
}

-(void)buttonClicked
{
    //创建第二个视图控制器
    SecondViewController * svc = [[SecondViewController alloc]init];
    
    [self.view.window setTrasitonAnimation:10 duration:2 towardType:1];
    
//    //自定义动画切换类型
//    //初始化动画对象
//    CATransition * transition = [[CATransition alloc]init];
//    //设置动画执行时间
//    transition.duration = 1;
//    //设置动画类型
//    transition.type = @"cube";
//    //设置动画方向
//    transition.subtype = @"fromRight";
//    //添加动画
//    [self.view.window.layer addAnimation:transition forKey:nil];
//   
    
    //设置模态视图切换动画类型（系统）
    //svc.modalTransitionStyle =UIModalTransitionStylePartialCurl;
//    UIModalTransitionStyleCoverVertical ,     默认的方式,从下到上出现，从上到下消失
//    UIModalTransitionStyleFlipHorizontal,     左右翻转
//    UIModalTransitionStyleCrossDissolve,      淡入淡出
//    UIModalTransitionStylePartialCurl         翻页效果
    
    //视图控制器提供的，模态视图切换方式
    //第一个参数：需要呈现的视图控制器对象
    //第二个参数：是否需要呈现动画
    //第三个参数：block，呈现动画结束后的回调block
    
//    __weak ViewController * vc = self;
    [self presentViewController:svc animated:YES completion:^{
////        vc.view = nil;
   }];
//    //回到上一个界面，模态视图切换方式，只能从哪来的，回到哪去
//   [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
