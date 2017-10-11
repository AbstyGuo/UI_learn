//
//  ViewController.m
//  UIView_layer
//
//  Created by MS on 15-11-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIView 中实际显示的是layer，UIView是layer的控制器
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    //设置背景颜色
    label.backgroundColor = [UIColor cyanColor];
    //设置圆角
    label.layer.cornerRadius = 8;
    //设置边框颜色
    label.layer.borderColor = [UIColor redColor].CGColor;
    //设置边框宽度
    label.layer.borderWidth = 2;
    //裁剪边界,以下属性二选一
    //label.clipsToBounds = YES;
    label.layer.masksToBounds = YES;
    [self.view addSubview:label];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    //cornerRadiusd 的值是尺寸的一半时，刚好是一个圆
    view.layer.cornerRadius = 50;
    //cornerRadiusd 的值与尺寸相等是，刚好是一个菱形
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
