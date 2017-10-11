//
//  FirstViewController.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "FirstViewController.h"
#import "NextViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"changeColor" object:nil];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(nextVC:)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)changeColor:(NSNotification *)notify
{
    UIColor *color = notify.object;
    self.view.backgroundColor = color;
}
-(void)nextVC:(UIBarButtonItem *)item
{
    NextViewController *nvc = [[NextViewController alloc]init];
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
