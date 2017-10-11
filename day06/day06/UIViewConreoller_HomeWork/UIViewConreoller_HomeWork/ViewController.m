//
//  ViewController.m
//  UIViewConreoller_HomeWork
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *_mailLabel;//显示用户名
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mailLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    _mailLabel.textColor = [UIColor blackColor];
    
    _mailLabel.font = [UIFont boldSystemFontOfSize:25];
    _mailLabel.textAlignment = NSTextAlignmentCenter;
    
    _mailLabel.text = self.userName;
    [self.view addSubview:_mailLabel];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(250, 400, 80, 40)];
    //设置标题颜色
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@" 退 出 " forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    
    [self.view addSubview:button];
    
#define VALUE arc4random() % 256 /255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _mailLabel.text = [NSString stringWithFormat:@"%@,欢迎登录",self.userName];
    
}

-(void)buttonClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
