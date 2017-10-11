//
//  ShakeViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ShakeViewController.h"

#import "UIView+ShackAnimation.h"


@interface ShakeViewController ()

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [self getMyImageView]
    ;
    //第一个参数：摆动的弧度
    //一次摆动的时间
    //重复摆动的次数，0表示无限次
    [imageView shakeWithRaid:0.08 duration:0.5 repeatCount:0];
    //延迟5之后停止摆动
    [imageView performSelector:@selector(stopShake) withObject:nil afterDelay:5];
    
//    [imageView stopShake];
    
    
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
