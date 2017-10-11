//
//  SwipeViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //拿到图片
    UIImageView *imageView = [self getMyImageView];
    
    //UISwipeGestureRecognizer:滑动手势
    //Target:手势触发时调用方法的对象
    //action:手势触发时调用方法
    UISwipeGestureRecognizer *swip =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipImageView:)];
    //设置滑动手势的触发方向
    swip.direction = UISwipeGestureRecognizerDirectionUp;
    
    /*
     UISwipeGestureRecognizerDirectionRight 向右
     UISwipeGestureRecognizerDirectionLeft  向左
     UISwipeGestureRecognizerDirectionUp  向上滑动
     UISwipeGestureRecognizerDirectionDown 向下滑动
     */
    //添加滑动手势
    [imageView addGestureRecognizer:swip];
    
    //再加一个手势
    UISwipeGestureRecognizer *swip2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipImageView:)];
    //设置滑动方向
    swip2.direction = UISwipeGestureRecognizerDirectionDown;
    [imageView addGestureRecognizer:swip2];
    
    
    
}

-(void)swipImageView:(UISwipeGestureRecognizer *)swip
{
    NSLog(@"向上滑动了图片");
    //拿到承载手势的视图
    UIImageView *imageViwe = (id)swip.view;
    [UIView animateWithDuration:1 delay:0.5 options:0 animations:^{
        
        imageViwe.center = CGPointMake(self.view.center.x, - 200);
    } completion:^(BOOL finished) {
        //从父视图中移除
        [imageViwe removeFromSuperview];
    }];
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
