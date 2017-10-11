//
//  RootViewController.m
//  UIView_SubViews
//
//  Created by student on 15-11-18.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(35, 100, 250, 50)];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"第一个label";
    label1.textColor = [UIColor blackColor];
    label1.textAlignment =NSTextAlignmentCenter;
    label1.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:label1];
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 140, 250, 50)];
    label2.backgroundColor = [UIColor yellowColor];
    label2.text = @"第二个label";
    label2.textColor = [UIColor blackColor];
    label2.textAlignment =NSTextAlignmentCenter;
    label2.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:label2];
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(45, 180, 250, 50)];
    label3.backgroundColor = [UIColor greenColor];
    label3.text = @"第三个label";
    label3.textColor = [UIColor blackColor];
    label3.textAlignment =NSTextAlignmentCenter;
    label3.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:label3];
    UILabel * label4 = [[UILabel alloc]initWithFrame:CGRectMake(50, 220, 250, 50)];
    label4.backgroundColor = [UIColor blueColor];
    label4.text = @"第四个label";
    label4.textColor = [UIColor blackColor];
    label4.textAlignment =NSTextAlignmentCenter;
    label4.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:label4];
    
    
    //通过父视图操作子视图的层次
    
    //把任意一个子视图放到最外层
    [self.view bringSubviewToFront:label1];
    
    //把任意一个子视图放到最底层
    [self.view sendSubviewToBack:label4];
    
    //把任意一个子视图放到指定层,层次的下标从0开始
    [self.view insertSubview:label1 atIndex:1];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(55, 260, 250, 50)];
    label.backgroundColor = [UIColor orangeColor];
    label.text = @"新添加的label";
    label.textColor = [UIColor blackColor];
    label.textAlignment =NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth=YES;
    //把某一视图插入到指定子视图的上层
    [self.view insertSubview:label aboveSubview:label3];
    //把某一个视图插入到指定子视图的下层
    [self.view insertSubview:label3 belowSubview:label2];
    //交换两个子视图的层次
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:4];
    
    //同父视图的子视图层次关系：先添加的在最底层，后添加的在最外层
    //子视图在view.subviews数组中的顺序就是子视图从里到外的添加顺序
    //遍历self.view的所有子视图
    for (UIView * view in self.view.subviews) {
        UILabel * label = (id)view;
        NSLog(@"%@",label.text);
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
