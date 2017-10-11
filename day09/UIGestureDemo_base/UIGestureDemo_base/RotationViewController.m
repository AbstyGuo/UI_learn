//
//  RotationViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * imageView = [self getMyImageView];
   
    //旋转手势  UIRotationGestureRecognizer
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    [imageView addGestureRecognizer:rotation];//添加手势
    
}

//旋转手势触发时调用的方法
-(void)rotation:(UIRotationGestureRecognizer *)gesture
{
     UIImageView * imageView = [self getMyImageView];//拿到图片视图
    //旋转手势可以记录旋转的弧度
    CGFloat ro = gesture.rotation;//
    static CGFloat startRo;//用来记录手势开始时图片的旋转量
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        imageView.transform = CGAffineTransformMakeRotation(startRo+ro);
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        startRo +=ro;
    }
    
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
