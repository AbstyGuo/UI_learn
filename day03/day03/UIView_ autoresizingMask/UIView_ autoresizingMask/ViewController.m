//
//  ViewController.m
//  UIView_ autoresizingMask
//
//  Created by 夏婷 on 15/11/18.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 300)];
    view.backgroundColor = [UIColor yellowColor];
    view.tag = 10;
    [self.view addSubview:view];
    
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(20, 30, 230, 230)];
    subView.backgroundColor = [UIColor redColor];
    
    //view添加subView为子视图
    [view addSubview:subView];
    
    //停靠模式：父视图大小发生改变时，子视图的变化规律
    
    subView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    /**
     *UIViewAutoresizingNone 无变化
     *UIViewAutoresizingFlexibleLeftMargin 左边距自由，右边距固定
     *UIViewAutoresizingFlexibleWidth 宽度自由，左、右边距都固定
     *UIViewAutoresizingFlexibleRightMargin 右边距自由，左边距不变
     *UIViewAutoresizingFlexibleTopMargin 上边距自由，下边距固定
     *UIViewAutoresizingFlexibleHeight 高度自由，上下边距都固定
     *UIViewAutoresizingFlexibleBottomMargin 下边距自由，上边距固定
     */
    
    
    
    
    
    
    //UISlider继承于UIControl
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, view.frame.origin.y + view.frame.size.height + 50, self.view.frame.size.width - 100, 50)];
    //设置镂空部分的颜色
    slider.tintColor = [UIColor magentaColor];
    //设置最小值
    slider.minimumValue = 0.1;
    //设置最大值
    slider.maximumValue = 1.0;
    //设置当前值
    slider.value = 1.0;
    
    //第一个参数，滑块的值发生改变时，会向这个对象发送一个通知
    //第二参数，值发生改变时，要执行的方法
    //第三个参数：触发机制
    [slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:slider];
    
    
    
    
}
-(void)valueChange:(UISlider *)sender
{
    UIView *view = [self.view viewWithTag:10];
    //获取view位置和大小
    CGRect frame = view.frame;
    frame.size.width = (self.view.frame.size.width - 100) * sender.value;
    frame.size.height = 300 * sender.value;
    //重设view的大小
    view.frame = frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
