//
//  BaseViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#define VALUE arc4random() % 256 /255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    [self createControl];
}
//创建图片
-(void)createControl
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 250, 250)];
    imageView.image = [UIImage imageNamed:@"10_0.jpg"];
    imageView.tag = 50;
    //显示到屏幕中央 
    imageView.center = self.view.center;
    //设置响应用户事件属性
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
}
#pragma mark - 返回图片
-(UIImageView *)getMyImageView
{
    //返回添加的图片
    return (id)[self.view viewWithTag:50];
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
