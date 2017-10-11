//
//  MainPhotoViewController.m
//  day06_homeWork
//
//  Created by MS on 15-11-23.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "MainPhotoViewController.h"
#import "SecondPhotoViewController.h"

@interface MainPhotoViewController ()

@end

@implementation MainPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"photo_left_nav"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button1 setBackgroundImage:[UIImage imageNamed:@"photo_right_nav"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(itemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:button1];

    self.navigationItem.rightBarButtonItem = item1;
}

-(void)backItemClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)itemClicked
{
    SecondPhotoViewController * svc = [[SecondPhotoViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
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
