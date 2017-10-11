//
//  NextViewController.m
//  day07_homeWork
//
//  Created by MS on 15-11-24.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dd_home_background1.png"]];
    imageView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:imageView];
   
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
