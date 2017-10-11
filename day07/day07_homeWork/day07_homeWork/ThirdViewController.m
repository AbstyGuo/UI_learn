//
//  ThirdViewController.m
//  day07_homeWork
//
//  Created by MS on 15-11-24.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ThirdViewController.h"
#import "NextViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self navigationItemSetting];
    [super viewWillAppear:animated];
}

-(void)navigationItemSetting
{
    UINavigationBar * ngb = self.tabBarController.navigationController.navigationBar;
    ngb.tintColor = [UIColor whiteColor];
    UIImage * image = [UIImage imageNamed:@"life_my_account.png"];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(itemClicked)];
    self.tabBarController.navigationItem.leftBarButtonItem = item;
    
    UIImage * image1 = [UIImage imageNamed:@"iconfont-dingwei.png"];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(itemClicked)];
    self.tabBarController.navigationItem.rightBarButtonItem = item1;
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"玩乐";
    label.font = [UIFont boldSystemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.tabBarController.navigationItem setTitleView:label];
    
}

-(void)itemClicked
{
    NextViewController * nvc = [[NextViewController alloc]init];
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
