//
//  RootViewController.m
//  UIView_Animation
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
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    view.tag = 10;
    [self.view addSubview:view];
#if 0
    //1.不带block的动画
    //开始一段动画的标识
    [UIView beginAnimations:@"animationID" context:nil];
    //设置延迟时间
    [UIView setAnimationDelay:3];
    
    //设置动画执行时间
    [UIView setAnimationDuration:5];
    
    //设置重复执行次数
    [UIView setAnimationRepeatCount:1];
    //设置代理，
    [UIView setAnimationDelegate:self];
    //设置动画执行完毕的回调方法
    [UIView setAnimationDidStopSelector:@selector(animationStop:)];
    
    //设置动画将要开始执行时的回调方法
    [UIView setAnimationWillStartSelector:@selector(animationWillBegin)];
    // 设置完毕，设置view动画结束的最终状态
    //全屏
    view.frame = self.view.bounds;
    view.backgroundColor = [UIColor greenColor];
    view.alpha = 0.5;
    
    //提交动画设置
    [UIView commitAnimations];
#else
    //2.带block的动画
    
    //第一个参数：动画执行时间
    //第二参数：动画延迟时间
    //第三：动画类型
    //第四个参数，是一个block，动画结束之后的状态
    //第五个参数：动画结束之后的回调block
    //__unsafe_unretained
    __weak RootViewController *rvc = self;
    
    
    
//    [UIView animateKeyframesWithDuration:5 delay:3 options:0 animations:^{
//        view.frame = rvc.view.bounds;
//        view.backgroundColor = [UIColor greenColor];
//        view.alpha = 0.5;
//    } completion:^(BOOL finished) {
//        NSLog(@"动画执行完毕");
//        
//    }];
    
    void(^animationBlock)() = ^{
        view.frame = rvc.view.bounds;
        view.backgroundColor = [UIColor greenColor];
        view.alpha = 0.5;

    };
    void(^finishedBlock)(BOOL finished) = ^(BOOL finished){
        NSLog(@"动画执行结束");
    };
    //执行动画
    [UIView animateWithDuration:5 delay:3 options:0 animations:animationBlock completion:finishedBlock];
    
#endif
}
#pragma mark -动画结束回调方法
-(void)animationStop:(NSString *)animationID
{
    UIView *view = [self.view viewWithTag:10];
    
    if([animationID isEqualToString:@"animationID"])
    {
        //动画开始标志
        [UIView beginAnimations:nil context:nil];
        //延迟3秒之后开始执行
        [UIView setAnimationDelay:3];
        //设置动画执行时间
        [UIView setAnimationDuration:5];
        //设置动画结束的状态
        view.frame = CGRectMake(0, 0, 50, 50);
        view.center = self.view.center;
        view.backgroundColor = [UIColor redColor];
        view.alpha = 1;
        
        //提交动画
        [UIView commitAnimations];
        
    }
    
}

#pragma mark - 动画将要开始时的回调方法
-(void)animationWillBegin
{
    NSLog(@"动画要开始了");
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
