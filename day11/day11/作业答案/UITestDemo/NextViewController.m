//
//  NextViewController.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()<UIActionSheetDelegate>

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#define VALUE arc4random()%256/255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(nextVC)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];
}
-(void)backAction:(UIBarButtonItem *)item
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"返回到" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"首页" otherButtonTitles:@"上一页",@"第三页",@"第五页", nil];
    [sheet showInView:self.view];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.tabBarController.tabBar.hidden= YES;
    NSInteger count = self.navigationController.viewControllers.count;
    self.title = [NSString stringWithFormat:@"第%ld页",count];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.tabBarController.tabBar.hidden= NO;

}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger count = self.navigationController.viewControllers.count;
    NSArray *viewControllers = self.navigationController.viewControllers;
    switch (buttonIndex) {
        case 0:
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 2:
        {
            if (count >= 3) {
                [self.navigationController popToViewController:viewControllers[2] animated:YES];
            }
        }
            
            break;
        case 3:
        {
            if (count >= 5) {
                [self.navigationController popToViewController:viewControllers[4] animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}
-(void)nextVC
{
    NextViewController *nvc = [[NextViewController alloc]init];
    NSInteger count = self.navigationController.viewControllers.count;
    nvc.title = [NSString stringWithFormat:@"第%ld页",count];
    [self.navigationController pushViewController:nvc animated:YES];
    
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
