//
//  PichViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "PichViewController.h"

@interface PichViewController ()

@end

@implementation PichViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //取出图片
    UIImageView *imageView = [self getMyImageView];
    //UIPinchGestureRecognizer:缩放手势或捏合手势
    //Target:手势触发时调用方法的对象
    //action：手势触发时调用的方法
    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    //添加手势
    [imageView addGestureRecognizer:pinch];
}
//缩放手势触发时调用的方法
-(void)pinch:(UIPinchGestureRecognizer *)gesture
{
    //缩放手势能够记录缩放量
    CGFloat scale = gesture.scale;
    
    UIImageView *imageView = (id)gesture.view;
    static CGFloat startScale = 1;//记录每一次开始时的缩放量
    //手势的缩放量变化时
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        //缩放通过设置拉伸形变实现
        imageView.transform = CGAffineTransformMakeScale(startScale * scale, startScale * scale);
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        //手势结束时，记录最终的缩放量，作为下一缩放的起始缩放量
        startScale *= gesture.scale;
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
