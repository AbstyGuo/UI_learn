//
//  RootViewController.m
//  YYCalenderDemo
//
//  Created by 夏婷 on 15/9/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"
#import "YYCalenderViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel
                      alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    label.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer  *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectDate:)];
    label.userInteractionEnabled = YES;
    label.tag = 10;
    [label addGestureRecognizer:tap];
    [self.view addSubview:label];

    
}

-(void)selectDate:(UITapGestureRecognizer *)gesture
{
    UILabel *label = (id)[self.view viewWithTag:10];
    YYCalenderViewController *cal = [[YYCalenderViewController alloc]initWithStyle:NonePastStyle];
    cal.selectDate = ^(NSString *dateStr){
        label.text = dateStr;
    };
    [self.navigationController pushViewController:cal animated:YES];
    
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
