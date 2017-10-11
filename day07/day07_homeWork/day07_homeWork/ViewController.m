//
//  ViewController.m
//  day07_homeWork
//
//  Created by MS on 15-11-24.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self navigationItemSetting];
}
-(void)navigationItemSetting
{
    UINavigationBar * ngb = self.tabBarController.navigationController.navigationBar;
    ngb.tintColor = [UIColor whiteColor];
    UIImage * image = [UIImage imageNamed:@"life_my_account.png"];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(itemClicked)];
    self.tabBarController.navigationItem.leftBarButtonItem = item;
    
    UIImage * image1 = [UIImage imageNamed:@"icon-search-o.png"];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(itemClicked)];
//    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    self.tabBarController.navigationItem.rightBarButtonItem = item1;
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"订阅";
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

@end
