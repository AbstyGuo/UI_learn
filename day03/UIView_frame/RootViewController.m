//
//  RootViewController.m
//  UIView_frame
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
	//UIView所有视图的直接或间接父类
    UILabel * view = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 100)];
    view.frame = CGRectMake(50, 150, view.frame.size.width, view.frame.size.height);
    /**
     *  frame:
     第一个参数：左上角相对于父视图的坐标原点（0，0）的横向距离，x坐标
     第二个参数：左上角相对于父视图的坐标原点（0，0）的纵向距离，y坐标
     第三个参数：View的宽度
     第四个参数：View的高度
     */
    //设置中心点，是视图的几何中心点，相对于父视图坐标原点
    view.center = CGPointMake(0, 0);//（0，0）等同于CGPointZero
    
    //重设中心点
    view.center = self.view.center;
    
    //我们可以通过frame 或center，改变视图的位置
    //设置bounds属性
    view.bounds = CGRectMake(0, 0, view.frame.size.width, 50);
    /**
     *  bounds
     第一个参数：坐标原点距离左上角的横向距离
     第二个参数：坐标原点距离左上角的纵向距离
     frame 影响的是自身在父视图中的布局
     bounds 影响它子视图的布局
     frame和bounds后两个参数都影响视图的大小
     */
    
//    UIView * view1 = [[UIView alloc]init];
//    view1.frame = CGRectMake(10, 10, 50, 50);
//    view1.backgroundColor = [UIColor blueColor];
//    [view addSubview:view1];
    
    //设置背景颜色
    view.backgroundColor = [UIColor cyanColor];
    //添加到当前视图控制器上
    [self.view addSubview:view];
    
    //view的形变属性
    view.text = @"What are you 弄啥咧?";
    view.font = [UIFont boldSystemFontOfSize:50];
    view.adjustsFontSizeToFitWidth=YES;
    view .textColor = [UIColor blackColor];
    view.frame = CGRectMake(50, 200, self.view.frame.size.width-100, 100);
    //拉伸形变
    //拉伸的比例，大于1表示拉伸，小于1表示压缩,前一个横向，后一个纵向
    //负数表示翻转，用1.CGAffineTransformMakeScale方法设置的拉伸形变是不叠加的
    view.transform = CGAffineTransformMakeScale(0.5,3);
    //2.CGAffineTransformScale叠加形变的方法
    view.transform = CGAffineTransformScale(view.transform, 2, 0.4);
    
    //旋转形变
    //1.CGAffineTransformMakeRotation不叠加旋转
    //180度 对应 M_PI   1度  对应 M_PI / 180
    view.transform = CGAffineTransformMakeRotation(M_PI_2);
    view.transform = CGAffineTransformMakeRotation([self radForDegrees:45]);
    //2.CGAffineTransformRotate叠加旋转对应的方法
    view.transform = CGAffineTransformRotate(view.transform, [self radForDegrees:120]);
}

//获取任意度数所对应的弧度
-(CGFloat)radForDegrees:(CGFloat)degrees
{
    return degrees * M_PI/180;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
