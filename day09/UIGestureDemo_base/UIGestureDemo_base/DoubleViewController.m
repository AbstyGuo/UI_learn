//
//  DoubleViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "DoubleViewController.h"

@interface DoubleViewController ()<UIGestureRecognizerDelegate>//手势协议方法

@end

@implementation DoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageView = [self getMyImageView];
    
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;//设置代理
    [imageView addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;//设置代理
    [imageView addGestureRecognizer:rotation];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    button.tag = 80;
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
    tap.numberOfTapsRequired = 1;//点击次数
    tap.numberOfTouchesRequired = 1;//手指个数
    tap.delegate = self;//指定代理
    [imageView addGestureRecognizer:tap];
}

-(void)taped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"响应点击手势");
}

-(void)buttonClicked
{
    NSLog(@"响应按钮点击事件");
}

//缩放手势触发时调用的方法
-(void)pinch:(UIPinchGestureRecognizer *)gesture
{
    //通过设置形变属性来实现缩放，在上一次的基础上进行形变，设置形变的方法应该用可叠加的方法
    //取出承载手势的视图
    UIImageView * imageView = [self getMyImageView];
    imageView.transform = CGAffineTransformScale(imageView.transform, gesture.scale, gesture.scale);
    [gesture setScale:1];//重置缩放倍数
}

//旋转手势触发时调用的方法
-(void)rotation:(UIRotationGestureRecognizer *)gesture
{
    //叠加旋转，在上一次旋转的基础上再旋转
    UIImageView * imageView = (id)gesture.view;//获取承载手势的视图
    imageView.transform = CGAffineTransformRotate(imageView.transform, gesture.rotation);
    [gesture setRotation:0];//重置手势的旋转量
}

#pragma mark - 关于事件冲突时解决方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //通过这个方法返回UITouch是否被识别成手势，返回yes识别成手势，返回no识别出普通的触摸
    if (touch.view.tag ==80) {
        return YES;//如果触摸到图片，识别成手势
    }else{
        return YES;//识别成普通的触摸
    }
}

//返回是否支持多手势YES支持，NO支持
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
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
