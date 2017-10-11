//
//  RootViewController.m
//  UIView_frame
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
    //UIView所有视图的直接或间接父类
    UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 100)];
    //设置frame
    
    view.frame = CGRectMake(50, 150, view.frame.size.width, view.frame.size.height);
    
    /**
     *  frame:
     第一个参数：左上角相对于父视图的坐标原点（0,0）的横向距离，x坐标
     第二参数：左上角距离父视图坐标原点的纵向距离
     第三个参数，View的宽度
     第四个参数，是View的高度
     */
    //设置中心点的坐标是视图的几何中心点，相对于父视图坐标原点得出
    view.center = CGPointMake(0, 0);//CGPointZero

    //重设中心点
    view.center = self.view.center;
    
    //我们可以通过frame 或中center，改变视图的位置
    //设这bounds 属性，
    view.bounds = CGRectMake(0, 0, view.frame.size.width, 300);
    /**
     * bounds
     第一个参数： 坐标原点距离左上角的横向距离
     第二参数：坐标原点距离左上角的纵向距离
     frame 影响的时自身在父视图中得布局
     bounds 影响它子视图的布局
     frame和bounds后两个参数都影响视图的大小
     
     */
    
//    UIView *view1 = [[UIView alloc]init];
//    view1.frame = CGRectMake(0, 10, 50, 50);
//    view1.backgroundColor = [UIColor blueColor];
//    
//    [view addSubview:view1];
    
    //设置背景颜色
    view.backgroundColor = [UIColor cyanColor];
    //添加到当前视图控制器上
    [self.view addSubview:view];
    
    //view的形变属性
    
    view.text = @"What are you 弄啥呢 ？";
    view.font = [UIFont boldSystemFontOfSize:50];
    view.adjustsFontSizeToFitWidth = YES;
    view.textColor = [UIColor blackColor];
    view.frame = CGRectMake(50, 200, self.view.frame.size.width - 100, 100);
    //拉伸形变
    //横向拉伸的比例，大于1表示拉伸，小于1表示压缩
    //负数表示翻转
    
    //1.用CGAffineTransformMakeScale方法设置的拉伸形变是不叠加
    view.transform = CGAffineTransformMakeScale(-1, 1.5);
    view.transform = CGAffineTransformMakeScale(1, 1);
    
    //2.CGAffineTransformScale这方法会叠加形变
    view.transform = CGAffineTransformScale(view.transform, -1, 1.5);
    view.transform = CGAffineTransformScale(view.transform, -1, 1.5);
    
    //旋转形变
    //1.CGAffineTransformMakeRotation不叠加旋转
    view.transform = CGAffineTransformMakeRotation(M_PI_2);
    view.transform = CGAffineTransformMakeRotation(M_PI_2);
    //180 度对应   M_PI
    //1 度对应 M_PI / 180
    //
    view.transform = CGAffineTransformMakeRotation([self radForDegrees:90]);
    
    //2.CGAffineTransformRotate 叠加旋转
    view.transform = CGAffineTransformRotate(view.transform, [self radForDegrees:90]);
}
//获取任意度数所对应的弧度
-(CGFloat)radForDegrees:(CGFloat)degree
{
    return degree * M_PI / 180;
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
