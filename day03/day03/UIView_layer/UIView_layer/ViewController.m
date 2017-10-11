//
//  ViewController.m
//  UIView_layer
//
//  Created by 夏婷 on 15/11/18.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UIView 中实际显示的是layer，UIView是layer的控制器
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    //设置背景颜色
    label.backgroundColor = [UIColor cyanColor];
    //设置圆角
    label.layer.cornerRadius = 8;
    //设置边框的颜色
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    // 设置边框的宽度
    label.layer.borderWidth = 1;
    //裁剪边界，以下两个属性二选一设置一个就行
//    label.clipsToBounds = YES;
    label.layer.masksToBounds = YES;
    
    [self.view addSubview:label];
    
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    
    //cornerRadius 是尺寸的一半时，刚好是一个圆
    view.layer.cornerRadius = 50;
    
    //cornerRadius 是与尺寸相等时，刚好是一个菱形
//    view.layer.cornerRadius = 100;

    [self.view addSubview:view];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
