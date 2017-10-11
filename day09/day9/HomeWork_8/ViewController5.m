//
//  ViewController5.m
//  HomeWork_8
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"加载5");

    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 50)];
    slider.tag = 50;
    slider.minimumValue = 0;
    slider.maximumValue = 255.0;
    [self.view addSubview:slider];
    
    UISlider *slider1 = [[UISlider alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    slider1.tag = 60;
    slider1.minimumValue = 0;
    slider1.maximumValue = 255.0;
    [self.view addSubview:slider1];
    
    UISlider *slider2 = [[UISlider alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 50)];
    slider2.tag = 70;
    slider2.minimumValue = 0;
    slider2.maximumValue = 255.0;
    [self.view addSubview:slider2];
    [slider addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    
    [slider1 addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [slider2 addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, self.view.frame.size.width - 100, 50)];
    [button setTitle:@"设置" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonClicked
{
    UISlider *slider1 = (id)[self.view viewWithTag:50];
    UISlider *slider2 = (id)[self.view viewWithTag:60];
    UISlider *slider3 = (id)[self.view viewWithTag:70];
    UIColor *color = [UIColor colorWithRed:slider1.value / 255.0f green:slider2.value / 255.0f blue:slider3.value / 255.0f alpha:1];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"colorChanged" object:color];
    
    
}
-(void)valueChanged
{
    UISlider *slider1 = (id)[self.view viewWithTag:50];
    UISlider *slider2 = (id)[self.view viewWithTag:60];
    UISlider *slider3 = (id)[self.view viewWithTag:70];
    UIColor *color = [UIColor colorWithRed:slider1.value / 255.0f green:slider2.value / 255.0f blue:slider3.value / 255.0f alpha:1];
    self.view.backgroundColor = color;

    
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
