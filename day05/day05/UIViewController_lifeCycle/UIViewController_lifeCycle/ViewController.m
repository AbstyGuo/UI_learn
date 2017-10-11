//
//  ViewController.m
//  UIViewController_lifeCycle
//
//  Created by 夏婷 on 15/11/19.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "MyHeaderFile.h"

#import "SecondViewController.h"

#import "UIView+TransitionAnimation.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)loadView
{
    [super loadView];
    SHOW_FUNC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //__func__ 返回当前函数的名字 char *
//    NSLog(@"%s",__func__);
    SHOW_FUNC
    
    //创建一个按钮，点击按钮时，进入下一个界面
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    [button setTitle:@"进入下一个界面" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonCliked) forControlEvents:UIControlEventTouchUpInside];
    
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
    SHOW_FUNC
}

-(void)buttonCliked
{
    //创建SecondViewController的对象
    SecondViewController *svc = [[SecondViewController alloc]init];
    //设置切换动画类型
//    svc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
//    
//    //初始化动画对象
//    CATransition *transition = [[CATransition alloc]init];
//    //2.设置动画执行时间
//    transition.duration = 1;
//    //3.设置动画类型
//    transition.type = @"cube";
//    //4.设置动画方向
//    transition.subtype = @"fromRight";
//    //添加动画
//    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self.view.window addTransition:1 animationType:AnimationTypeCube subType:AnimationSubTypeFromRight];
    /*
     UIModalTransitionStyleCoverVertical = 0, 从下到上出现，从上到下消失
     UIModalTransitionStyleFlipHorizontal, 左右翻转
     UIModalTransitionStyleCrossDissolve, 淡入淡出
     UIModalTransitionStylePartialCurl //翻页效果
     */
    
    //视图控制器提供的，模态视图切换方式
    //第一个参数：需要呈现的视图控制器对象
    //第二参数：是否需要呈现动画，YES，需要，NO就是不需要
    //第三参数：block，呈现动画结束之后的回调block
    
    
    __weak ViewController *vc = self;
    [self presentViewController:svc animated:YES completion:^{
//        vc.view = nil;
    }];
    
    
    //回到上一个界面，模态视图切换方式，只能从哪来的，回哪去
    /*[self dismissViewControllerAnimated:YES completion:^{
        
    }];*/
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
