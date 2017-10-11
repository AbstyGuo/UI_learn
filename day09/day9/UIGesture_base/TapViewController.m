//
//  TapViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //拿到图片视图
    UIImageView *imageView = [self getMyImageView];
    //UITapGestureRecognizer 点击手势
    //Target :手势事件触发时，调用方法的对象
    //action:手势触发事件时，Target调用的方法
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
    //设置触发的点击次数
    tapGesture.numberOfTapsRequired = 2;
    //设置点击的手指个数
    tapGesture.numberOfTouchesRequired = 2;
    //给图片添加点击手势
    [imageView addGestureRecognizer:tapGesture];
}
//点击图片时的触发事件
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
