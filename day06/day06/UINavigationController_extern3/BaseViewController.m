//
//  BaseViewController.m
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#define VALUE arc4random() % 256 / 255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.size.width - 200, 50)];
    button.backgroundColor = [UIColor cyanColor];
    //设置标题
    [button setTitle:@"下一级界面" forState:UIControlStateNormal];
    //设置标题颜色
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, self.view.frame.size.width - 100, 50)];
    label.textColor = [UIColor redColor];
    
    label.font = [UIFont boldSystemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 100;
    
    [self.view addSubview:label];
    
}
//set方法中实现显示
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    UILabel *label = (id)[self.view viewWithTag:100];
    label.text = _titleStr;
}
-(void)buttonclicked
{
    
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
