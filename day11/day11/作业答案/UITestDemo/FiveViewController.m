//
//  FiveViewController.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *r = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 20, 30)];
    r.text = @"R";
    r.textColor = [UIColor cyanColor];
    r.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:r];
    UISlider *slider1 = [[UISlider alloc]initWithFrame:CGRectMake(40, 100, self.view.frame.size.width - 80, 30)];
    slider1.minimumValue = 0;
    slider1.maximumValue = 255;
    slider1.value = 255;
    slider1.tag = 10;
    [slider1 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider1];
    
    
    UILabel *g = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 20, 30)];
    g.text = @"G";
    g.textColor = [UIColor cyanColor];
    g.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:g];
    UISlider *slider2 = [[UISlider alloc]initWithFrame:CGRectMake(40, 200, self.view.frame.size.width - 80, 30)];
    slider2.minimumValue = 0;
    slider2.maximumValue = 255;
    slider2.value = 255;
    slider2.tag = 20;
    [slider2 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider2];
    
    UILabel *b = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 20, 30)];
    b.text = @"B";
    b.textColor = [UIColor cyanColor];
    b.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:b];
    UISlider *slider3 = [[UISlider alloc]initWithFrame:CGRectMake(40, 300, self.view.frame.size.width - 80, 30)];
    slider3.minimumValue = 0;
    slider3.maximumValue = 255;
    slider3.value = 255;
    slider3.tag = 30;
    [slider3 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider3];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 400, 100, 50)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"设置" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)buttonClicked
{
    UISlider * slider1 = (id)[self.view viewWithTag:10];
    UISlider * slider2 = (id)[self.view viewWithTag:20];
    UISlider * slider3 = (id)[self.view viewWithTag:30];
    UIColor *color = [UIColor colorWithRed:slider1.value/255.0f green:slider2.value/255.0f blue:slider3.value/255.0f alpha:1];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:color];
}

-(void)valueChanged:(UISlider *)slider
{
    UISlider * slider1 = (id)[self.view viewWithTag:10];
    UISlider * slider2 = (id)[self.view viewWithTag:20];
    UISlider * slider3 = (id)[self.view viewWithTag:30];
    self.view.backgroundColor = [UIColor colorWithRed:slider1.value/255.0f green:slider2.value/255.0f blue:slider3.value/255.0f alpha:1];
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
