//
//  TouchViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()

{
    CGPoint _startPoint;//触摸的起始点
    CGPoint _center;//触摸开始时图的中心点
}
@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//触摸开始调用这个方法，是UIResponse类的实例方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"触摸开始");
    
    UIImageView *imageView = [self getMyImageView];
    _center = imageView.center;
    //首先拿到触摸对象
    //UITouch 是一个触摸类，取出一个触摸
    UITouch *touch = touches.anyObject;

    //拿到触摸在self.view中的坐标
    _startPoint = [touch locationInView:self.view];
    
    //获取所有的触摸位置
    NSSet *allTouches = event.allTouches;
    for (UITouch * oneTouch in allTouches)
    {
        NSLog(@"触摸点：%@",NSStringFromCGPoint([oneTouch locationInView:self.view]));
    }
    
    
    
    
}
//手指在屏幕上移动时，调用这个方法
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸移动中");
    //通过起始位置和当前触摸的位置，得到移动的偏移量
    //拿到触摸对象
    UITouch *touch = touches.anyObject;
    //取出当前触摸在self.view中的位置
    CGPoint point = [touch locationInView:self.view];
    
    //横向偏移量
    CGFloat x = point.x - _startPoint.x;
    
    //纵向偏移量
    CGFloat y = point.y - _startPoint.y;
    //重设置起始位置
    _startPoint = point;
    
    //取出图片
    UIImageView *imageView = [self getMyImageView];
    //touch.view:承载触摸的视图
    if(touch.view != imageView)
    {
        return;
    }
    
    
    //移动相同的偏移量
    //横向移动相同的距离
    _center.x +=x;
    //纵向移动相同的距离
    _center.y += y;
    // 重设置图片中心点
    imageView.center = _center;

}
//触摸结束时调用这个方法
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}
//取消触摸，例如来电打断
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
