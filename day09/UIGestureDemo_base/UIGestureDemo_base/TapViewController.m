//
//  TapViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //拿到图片视图
    UIImageView * imageView = [self getMyImageView];
    //创建点击手势  UITapGestureRecognizer
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
    //设置触发的点击次数
    tapGesture.numberOfTapsRequired = 2;//默认1次
    //设置点击手指个数
    tapGesture.numberOfTouchesRequired = 2;//默认1个
    //给图片添加点击手势
    [imageView addGestureRecognizer:tapGesture];
    
}

#pragma mark - 点击图片时的触发方法
-(void)taped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"图片被点击");
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
