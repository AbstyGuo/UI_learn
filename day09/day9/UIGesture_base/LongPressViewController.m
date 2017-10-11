//
//  LongPressViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //长按手势:UILongPressGestureRecognizer
    
    //Target:长按手势触发时，调用方法的对象
    //action:长按手势触发时，调用的方法
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressed:)];
    //设置最短的触发时间
    longPress.minimumPressDuration = 0.5;
    //取出图片
    UIImageView * imageView = [self getMyImageView];
    //给图片添加长按手势
    [imageView addGestureRecognizer:longPress];
    
}
//长按手势触发方法
-(void)longPressed:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        /*
         UIGestureRecognizerStateBegan 手势开始
         */
        
        NSLog(@"长按小喵咪");

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
