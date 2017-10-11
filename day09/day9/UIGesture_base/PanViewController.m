//
//  PanViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //UIPanGestureRecognizer:平移手势
    //创建平移手势
    //Target：手势触发时调用方法的对象
    //action:触发手势调用的方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panImageView:)];
    //取出图片
    UIImageView *imageView = [self getMyImageView];
    
    //添加平移手势
    [imageView addGestureRecognizer:pan];

}

-(void)panImageView:(UIPanGestureRecognizer *)geture
{
    //取到承载手势的视图
    UIImageView *imageView = (UIImageView *)geture.view;
    //获取手势的偏移量
    CGPoint point = [geture translationInView:self.view];
    static CGPoint startPoint;//记录起始状态的图片中心点
    if (geture.state == UIGestureRecognizerStateBegan)
    {
        //手势开始时，记录起始位置
        startPoint = imageView.center;
    }
    
    if(geture.state == UIGestureRecognizerStateChanged || geture.state == UIGestureRecognizerStateEnded)
    {
        //手势变化状态或结束时 ，imageView跟随移动
        imageView.center = CGPointMake(startPoint.x + point.x, startPoint.y + point.y);
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
