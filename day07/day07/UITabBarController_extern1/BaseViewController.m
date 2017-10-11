//
//  BaseViewController.m
//  UITabBarController_base
//
//  Created by 夏婷 on 15/11/24.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#define VALUE  arc4random() % 256 / 255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    // 放到屏幕中央
    label.center = self.view.center;
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    //对齐方式居中
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 30;
    [self.view addSubview:label];
}
//重写title的set方法，改变label显示的文字
-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *label = (id)[self.view viewWithTag:30];
    label.text = title;
    
    
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
