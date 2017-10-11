//
//  SwipeViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "SwipeViewController.h"
#import "UIView+ShackAnimation.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageView = [self getMyImageView];//拿到图片
    //创建滑动手势
    UISwipeGestureRecognizer * swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImageView:)];
    //设置滑动手势的触发方向
    swip.direction = UISwipeGestureRecognizerDirectionUp;
    /*
     UISwipeGestureRecognizerDirectionRight     右
     UISwipeGestureRecognizerDirectionLeft      左
     UISwipeGestureRecognizerDirectionUp        上
     UISwipeGestureRecognizerDirectionDown      下
     */
    [imageView addGestureRecognizer:swip];//给图片添加向上滑动手势
    
    //再加一个手势
    UISwipeGestureRecognizer * swip2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImageView:)];
    swip2.direction = UISwipeGestureRecognizerDirectionDown;
    [imageView addGestureRecognizer:swip2];
}

-(void)swipeImageView:(UISwipeGestureRecognizer *)swip
{
    NSLog(@"向上滑动了图片");
    UIImageView * imageView = (id)swip.view;
    
//   UIImageView * imageView = [self getMyImageView];
    [imageView shakeWithRaid:0.02 duration:0.01 repeatCount:0];
    //第一个参数：摇动的弧度
    //第二个参数：一次摆动的事件
    //第三个参数：重复摆动的次数，0表示无限次
    [imageView performSelector:@selector(stopShake) withObject:nil afterDelay:10];

//    
//    [UIView animateWithDuration:1 delay:3 options:0 animations:^{
//        imageView.center = CGPointMake(self.view.center.x, -100);
//    }completion:^(BOOL finished){
//        
//    }];
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
