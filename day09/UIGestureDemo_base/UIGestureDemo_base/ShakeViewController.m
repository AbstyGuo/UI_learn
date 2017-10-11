//
//  ShakeViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ShakeViewController.h"
#import "UIView+ShackAnimation.h"

@interface ShakeViewController ()

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImageView * imageView = [self getMyImageView];
    [imageView shakeWithRaid:0.02 duration:0.01 repeatCount:0];
    //第一个参数：摇动的弧度
    //第二个参数：一次摆动的事件
    //第三个参数：重复摆动的次数，0表示无限次
    [imageView performSelector:@selector(stopShake) withObject:nil afterDelay:10];
    
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
