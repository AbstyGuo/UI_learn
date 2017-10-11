//
//  ViewController.m
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "BookCell.h"
#import "ADScrollView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置导航条样式
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //设置导航条不透明
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"书籍推荐";
    //读取数据源
   
    




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
