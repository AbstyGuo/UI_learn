//
//  ViewController.m
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建按钮，触发跳转
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, self.view.frame.size.width - 200, 50)];
    //设置标题
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"去输入";
    //字体适应宽度
    label.adjustsFontSizeToFitWidth = YES;
    //设置文字颜色
    label.textColor = [UIColor blackColor];
    label.tag = 10;
    [self.view addSubview:label];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UILabel *label = (id)[self.view viewWithTag:10];
    //从本地取出showText
    NSString *showText = [[NSUserDefaults standardUserDefaults] objectForKey:@"showText"];
    label.text = showText;
    
    
}

//实现跳转
-(void)buttonClicked
{
    
    //创建视图控制器
    SecondViewController *svc = [[SecondViewController alloc]init];
    svc.egStr = @"dshduvacb";
    // 设置跳转动画类型
    svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //跳转到第二视图控制器
    [self presentViewController:svc animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
