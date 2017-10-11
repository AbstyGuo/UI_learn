//
//  BaseViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createControl];
#define VALUE arc4random() % 256 /255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
    
}

-(void)createControl
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
