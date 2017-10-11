//
//  PanViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIPanGestureRecognizer  平移手势
    //创建平移手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panImageView:)];
    
    UIImageView * imageView = [self getMyImageView];//取出图片
    [imageView addGestureRecognizer:pan];//添加平移手势
}

-(void)panImageView:(UIPanGestureRecognizer *)gesture
{
    UIImageView * imageView = (id)gesture.view;//取到承载手势的图片视图
    //获取手势的偏移量
    CGPoint point = [gesture translationInView:self.view];//参数为在某个视图中的偏移量
    static CGPoint startPoint;//记录起始状态的图片中心点
    if (gesture.state == UIGestureRecognizerStateBegan) {
        startPoint = imageView.center;
    }
    else{
        imageView.center = CGPointMake(startPoint.x+point.x, startPoint.y+point.y);
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
