//
//  UISliderViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UISliderViewController.h"

@interface UISliderViewController ()

@end

@implementation UISliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建slider
-(void)createControl
{
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 30)];
    slider.tintColor = [UIColor redColor];
    slider.tag = 50;
    //设置最小值
    slider.minimumValue = 0;
    //设置最大值
    slider.maximumValue = 255.0f;
    //可以设置最小值图片
    slider.minimumValueImage = [UIImage imageNamed:@"logo_title.png"];
    //设置最大值图片
    slider.maximumValueImage = [UIImage imageNamed:@"sendingBmp.gif"];
    //添加滑动事件    Target:调用方法的对象  action:调用方法的名字      ControlEvents:触发时机
    [slider addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UISlider * slider1 = [[UISlider alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 30)];
    slider1.tintColor = [UIColor redColor];
    slider1.tag = 60;
    //设置最小值
    slider1.minimumValue = 0;
    //设置最大值
    slider1.maximumValue = 255.0f;
    //可以设置最小值图片
    slider1.minimumValueImage = [UIImage imageNamed:@"logo_title.png"];
    //设置最大值图片
    slider1.maximumValueImage = [UIImage imageNamed:@"sendingBmp.gif"];
    //添加滑动事件    Target:调用方法的对象  action:调用方法的名字      ControlEvents:触发时机
    [slider1 addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];
    
    UISlider * slider2 = [[UISlider alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width-100, 30)];
    slider2.tintColor = [UIColor redColor];
    slider2.tag = 70;
    //设置最小值
    slider2.minimumValue = 0;
    //设置最大值
    slider2.maximumValue = 255.0f;
    //可以设置最小值图片
    slider2.minimumValueImage = [UIImage imageNamed:@"logo_title.png"];
    //设置最大值图片
    slider2.maximumValueImage = [UIImage imageNamed:@"sendingBmp.gif"];
    //添加滑动事件    Target:调用方法的对象  action:调用方法的名字      ControlEvents:触发时机
    [slider2 addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider2];
}

#pragma mark - 实现滑动时触发的方法
-(void)valueChanged
{
    UISlider * redSlider = (id)[self.view viewWithTag:50];
    UISlider * greedSlider = (id)[self.view viewWithTag:60];
    UISlider * blueSlider = (id)[self.view viewWithTag:70];
    self.view.backgroundColor = [UIColor colorWithRed:redSlider.value/255.0f green:greedSlider.value/255.0f blue:blueSlider.value/255.0f alpha:1];
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
