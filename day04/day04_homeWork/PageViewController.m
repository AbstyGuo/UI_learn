//
//  PageViewController.m
//  day04_homeWork
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(50, 80, self.view.frame.size.width-100, self.view.frame.size.height-130)];
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.placeholder = @"主页";
    [self.view addSubview:field];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 30, 60, 30)];
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)Back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
