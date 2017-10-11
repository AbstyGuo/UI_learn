//
//  FourViewController.m
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"第四层";
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏导航条
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //显示导航条
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;

}

-(void)buttonclicked
{
    //退出到上一层
    //参数是否需要动画
    [self.navigationController popViewControllerAnimated:YES];
    //返回到导航控制器中得任意一个视图控制器
    //拿到导航控制器中所有的视图控制器,视图控制器在数组中得顺序就是添加顺序
    NSArray *viewControllers = self.navigationController.viewControllers;
    //返回到指定的视图控制器
    //第一个参数： 返回的视图控制器
    //第二参数：是否需要动画
//    [self.navigationController popToViewController:viewControllers[1] animated:YES];
    
    //直接返回到根视图
    //参数：是否需要动画
//    [self.navigationController popToRootViewControllerAnimated:YES];
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
