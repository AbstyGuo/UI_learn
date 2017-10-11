//
//  RotationViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 旋转手势:UIRotationGestureRecognizer
    //Target：手势触发时调用方法的对象
    //action: 手势触发时调用的方法
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    //拿到imgeView
    UIImageView *imageView = [self getMyImageView];
    
    //添加手势
    [imageView addGestureRecognizer:rotation];
}
//旋转手势触发时调用的方法
-(void)rotation:(UIRotationGestureRecognizer *)gesture
{
    
    //旋转手势可以记录旋转的弧度
    CGFloat ro = gesture.rotation;
    static CGFloat startRo = 0;//用来记录手势开始时图片的旋转量

    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        //拿到图片视图
        UIImageView *imageView = [self getMyImageView];
        //设置形变属性
        imageView.transform = CGAffineTransformMakeRotation(startRo + ro);
    }
    //当旋转结束时，保存图片的旋转量，下一次旋转的起始值
    if(gesture .state == UIGestureRecognizerStateEnded)
    {
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
