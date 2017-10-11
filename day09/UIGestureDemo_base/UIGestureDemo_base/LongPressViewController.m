//
//  LongPressViewController.m
//  UIGestureDemo_base
//
//  Created by MS on 15-11-26.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //长按手势 UILongPressGestureRecognizer
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressed:)];
    //设置最短的触发时间
    longPress.minimumPressDuration = 2.0;
    
    UIImageView * imageView = [self getMyImageView];//取出图片
    [imageView addGestureRecognizer:longPress];
}

#pragma mark - 长按手势触发方法
-(void)longPressed:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"手势长按被触发");
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
