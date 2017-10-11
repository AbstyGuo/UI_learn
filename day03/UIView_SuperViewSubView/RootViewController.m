//
//  RootViewController.m
//  UIView_SuperViewSubView
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
    //创建一个UIView并设位置和大小
	UIView * superView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 200)];
    superView.backgroundColor = [UIColor cyanColor];
    
    //添加到当前视图控制 器的view上
    [self.view addSubview:superView];
    
    UIView * subView = [[UIView alloc]init];
    subView.frame = CGRectMake(10, 10, 50, 50);
    //设置背景颜色
    subView.backgroundColor = [UIColor magentaColor];
    //把subView添加到superView上
    //相对于superView我们把subView叫做superView的子视图，superView是subView的父视图
    [superView addSubview:subView];
    
    //父视图对子视图位置的影响
    superView.frame = CGRectMake(50, 300, self.view.frame.size.width-100, superView.frame.size.height);
    //父视图移动，子视图也跟随移动
    
    //通过修改父视图的bounds,影响子视图的布局，应用场景：通过修改父视图的bounds批量移动子视图
    superView.bounds=CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height);
    
    //父视图与子视图的透明关系
    //alpha透明度，一个从0~1的浮点数,0表示全透明，1表示不透明
    superView.alpha = 1;
    subView.alpha = 1;//子视图的实际透明度 = 父视图的alpha值*子视图的alpha值。
    //子视图跟随父视图的透明度
    
    //父视图隐藏，子视图也跟随隐藏
    superView.hidden = NO;
    //单独隐藏子视图
    subView.hidden = NO;
    
    subView.tag =20 ;
    
    //父视图是唯一的，一个视图只能被添加到一个视图上
    subView.superview.backgroundColor = [UIColor yellowColor];
    //通过父视图拿到所有的子视图
    NSArray * subViews = superView.subviews;
    UIView * view1 = subViews[0];
    view1.backgroundColor = [UIColor purpleColor];
    
    //通过父视图拿到特定的某一个
    UIView * view = [superView viewWithTag:20];
    view.frame = CGRectMake(20, 20, 100, 100);
    
    //查找间接子视图
    [self findSunZiView];
}

-(void)findSunZiView
{
    //查找子视图时，先遍历直接子视图，如果找到了就返回，找不到就深度遍历到间接子视图中寻找，找到相应的视图返回，找不到就返回nil
    UIView * view = [self.view viewWithTag:20];
    //子视图可以主动从父视图中移除
    [view removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
