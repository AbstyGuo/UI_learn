//
//  UIStepperViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
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
    //步进器,继承于UIConrol,常用在购物软件中，添加或减少货物件数
    UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 50)];
   //大小不受frame控制,根据所设置的图片变大
    //设置背景图片
//    [stepper setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
    //是否自动重复增加减少
    stepper.autorepeat = YES;
    //是否连续，前提是autorepeat为YES，才起作用
    stepper.continuous = YES;
    //设置每次增加或减少的值
    stepper.stepValue = 5;
    //设置最大值,默认是100
    stepper.maximumValue = 1000;
    // 设置最小值，默认是0;
    stepper.minimumValue = 0;
    //设置当前值
    stepper.value = 10;
    
    //设置镂空部分的颜色
    stepper.tintColor = [UIColor cyanColor];
    //设置背景色
    stepper.backgroundColor = [UIColor magentaColor];
    //设置加号的图片,设置总是显示原色的图片，否则会显示轮廓
    UIImage *incImage = [[UIImage imageNamed:@"main_left_nav"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置普通状态的图片
    [stepper setIncrementImage:incImage forState:UIControlStateNormal];
    
    //设置减号的图片
    
    UIImage *decImage = [[UIImage imageNamed:@"main_left_nav"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置高亮状态的减号的图片
    [stepper setDecrementImage:decImage forState:UIControlStateHighlighted];
    
    //设置分割线的图片
    
    UIImage *image = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置分割线的图片，可以根据左右两边两个按钮的状态设置多张
    [stepper setDividerImage:image forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateHighlighted];
    
    //添加事件
    [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:stepper];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
    
    label.backgroundColor = [UIColor redColor];
    
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont boldSystemFontOfSize:25];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.tag = 80;
    [self.view addSubview:label];
    
    

}


-(void)valueChanged:(UIStepper *)stepper
{
    UILabel *label = (id)[self.view viewWithTag:80];
    label.text = [NSString stringWithFormat:@"当前值:%.2f",stepper.value];
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
