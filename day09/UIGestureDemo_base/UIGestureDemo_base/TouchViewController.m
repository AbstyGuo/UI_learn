//
//  TouchViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()
{
    CGPoint _startPoint;//触摸的起始点
    CGPoint _startOfImage;//触摸开始时图片的起始点
}
@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//触摸屏幕开始调用这个方法，是UIResponse类的实例方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始触摸");
    UIImageView * imageView = [self getMyImageView];
    _startOfImage = imageView.center;
    //首先拿到触摸对象
    //UITouch 是一个触摸类，取出一个触摸
    UITouch * touch = touches.anyObject;
    //拿到触摸在self.view中的坐标
    _startPoint = [touch locationInView:self.view];
    
    //获取所有的触摸位置
    NSSet * allTouches = event.allTouches;
    for (UITouch * oneTouch in allTouches) {
        NSLog(@"触摸点%@",NSStringFromCGPoint([oneTouch locationInView:self.view]));
    }
}

//手指在屏幕上移动时会调用这个方法
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"触摸移动中");
    UITouch * touch = touches.anyObject;
    //通过起始点和当前触摸位置计算偏移量
    CGFloat x = [touch locationInView:self.view].x-_startPoint.x;
    CGFloat y = [touch locationInView:self.view].y-_startPoint.y;
    
    UIImageView * imageView = [self getMyImageView];
    //touch.view 取出承载触摸的视图
    if (touch.view != imageView) {
        return;
    }
    //移动相同的偏移量
    imageView.center = CGPointMake(_startOfImage.x+x, _startOfImage.y+y);
    
}

//触摸结束时调用这个方法
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}

//取消触摸，例如来电打断会调用这个方法
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"取消触摸");
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
