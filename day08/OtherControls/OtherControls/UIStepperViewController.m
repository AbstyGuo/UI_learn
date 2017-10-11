//
//  UIStepperViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UIStepperViewController.h"

@interface UIStepperViewController ()

@end

@implementation UIStepperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    //步进器 继承于UIControl，常用在购物软件中，添加或减少货物件数
    UIStepper * stepper = [[UIStepper alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-100, 50)];
    //大小不受frame控制,根据所设置的图片变大或变小
   // [stepper setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];//设置背景图片
    stepper.autorepeat = YES;//是否自动重复增加或减少
    stepper.continuous = YES;//是否连续，前提是autorepeat为YES，才起作用
    stepper.value = 0;//设置当前值
    stepper.stepValue = 5;//设置每次增加的值
    //设置最大值（默认是100）和最小值(默认是0)
    stepper.maximumValue = 1000;
    stepper.minimumValue = 0;
    stepper.tintColor = [UIColor cyanColor];//设置镂空部分的颜色
    stepper.backgroundColor = [UIColor magentaColor];//设置背景颜色
    //设置+号的图片
    UIImage * incImage =[[UIImage imageNamed:@"main_left_nav"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//普通状态的图片
    [stepper setIncrementImage:incImage forState:UIControlStateNormal];
    //设置"—"号的图片,高亮状态的图片
    [stepper setDecrementImage:incImage forState:UIControlStateHighlighted];
    //设置分割线的图片 ,可以根据左右的状态，设置多个图片
    [stepper setDividerImage:incImage forLeftSegmentState:UIControlStateHighlighted rightSegmentState:UIControlStateNormal];
    
    //添加事件
    [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:stepper];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 40)];
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 80;
    [self.view addSubview:label];
}

-(void)valueChanged:(UIStepper *)stepper
{
    UILabel * label = (id)[self.view viewWithTag:80];
    label.text = [NSString stringWithFormat:@"当前值%.2f",stepper.value];
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
