//
//  RootViewController.m
//  UIView_Animation
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
	
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    view.backgroundColor = [UIColor blueColor];
    view.tag = 10;
    
    [self.view addSubview:view];
#if 0
    //1.不带block的动画
    //开始一段动画的标志
    [UIView beginAnimations:@"animationID" context:nil];
    //设置延迟时间
    [UIView setAnimationDelay:3];
    //设置动画执行时间
    [UIView setAnimationDuration:5];
    //设置重复执行次数
    [UIView setAnimationRepeatCount:1];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置动画执行完毕的回调方法
    [UIView setAnimationDidStopSelector:@selector(animationStop:)];
    //设置动画将要开始时的回调方法
    [UIView setAnimationWillStartSelector:@selector(animationWillBegin)];
    //设置完毕，设置view动画结束的最终状态:全屏
    view.frame = self.view.bounds;
    view.backgroundColor = [UIColor greenColor];
    view.alpha = 0.3;
    //提交动画设置
    [UIView commitAnimations];
#elif 0
    //2.带block的动画
    //第一个参数：动画执行时间
    //第二个参数：动画延迟时间
    //第三个参数：动画类型
    //第四个参数：block做参数，内部写动画结束后的状态
    //第五个参数：动画执行结束后的回调block
    //__unsafe_unretained和__weak弱引用，防止重复引用
    __weak RootViewController * rvc = self;
    
    [UIView animateKeyframesWithDuration:5 delay:3 options:0 animations:^{
        view.frame = rvc.view.bounds;
        view.backgroundColor = [UIColor greenColor];
        view.alpha = 0.3;
    }completion:^(BOOL finished){
       
    }];
#else
    __weak RootViewController * rvc = self;
    void(^animationBlock)()=^{
        view.frame = rvc.view.bounds;
        view.backgroundColor = [UIColor greenColor];
        view.alpha = 0.3;
    };
    void(^animationBlock1)()=^{
        view.frame = CGRectMake(50, 100, 50, 50);
        view.backgroundColor = [UIColor redColor];
        view.alpha = 1;
    };

    void(^finishedBlock)(BOOL finished)=^(BOOL finished){
        [UIView animateKeyframesWithDuration:5 delay:3 options:0 animations:animationBlock1 completion:finishedBlock];
    };
    //执行动画
    [UIView animateKeyframesWithDuration:5 delay:3 options:0 animations:animationBlock completion:finishedBlock];
    
#endif
    
    
}

#pragma mark - 动画结束回调方法
-(void)animationStop:(NSString * )animationID
{
    UIView * view = [self.view viewWithTag:10];
    if ([animationID isEqualToString:@"animationID"])
    {
        //动画开始标志
        [UIView beginAnimations:nil context:nil];
        //设置延迟时间
        [UIView setAnimationDelay:1];
        //设置动画执行时间
        [UIView setAnimationDuration:5];
        //设置重复执行次数
        [UIView setAnimationRepeatCount:3];
        view.frame = CGRectMake(50, 100, 50, 50);
        view.backgroundColor = [UIColor redColor];
        view.alpha = 1;
    }
}

#pragma mark - 动画将要开始时回调方法
-(void)animationWillBegin
{
    NSLog(@"动画要开始了");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
