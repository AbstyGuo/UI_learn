//
//  RootViewController.m
//  UiView_SubViews
//
//  Created by 夏婷 on 15/11/18.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 250, 50)];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"我是第一个label";
    label1.textColor = [UIColor blackColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label1];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 140, 250, 50)];
    label2.backgroundColor = [UIColor greenColor];
    label2.text = @"我是第二个label";
    label2.textColor = [UIColor blackColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(50, 180, 250, 50)];
    label3.backgroundColor = [UIColor blueColor];
    label3.text = @"我是第三个label";
    label3.textColor = [UIColor blackColor];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label3];
    
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(60, 220, 250, 50)];
    label4.backgroundColor = [UIColor orangeColor];
    label4.text = @"我是第四个label";
    label4.textColor = [UIColor blackColor];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label4];
    
    //同父视图的子视图层次关系：先添加的在最低层，后添加的在最外层
    //子视图在view.subviews 数组中得顺序，就是子视图从里到外的层次顺序
    //遍历self.view的所有子视图
    
    //通过父视图操作子视图的层次
    
    //把任意一个子视图放到最外层
    [self.view bringSubviewToFront:label1];
    label1.frame = CGRectMake(70, 260, 250, 50);
    
    //把任意子视图拿到最底层
    [self.view sendSubviewToBack:label4];
    
    //层次的下标从0开始，把任意子视图插入到指定层
    [self.view insertSubview:label1 atIndex:1];
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 230, 250, 50)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"我是新添加的label";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    //把某一视图插入到指定子视图的上层
    [self.view insertSubview:label aboveSubview:label3];
    //把某一子视图插入到指定子视图的底层
    [self.view insertSubview:label3 belowSubview:label1];
    
    //交换两个子视图的层次
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:4];
    
    
    for(UIView *view in self.view.subviews)
    {
        UILabel *label = (id)view;
        NSLog(@"%@",label.text);
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
