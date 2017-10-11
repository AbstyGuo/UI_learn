//
//  ViewController.m
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"

@interface ViewController ()<ShowTextDelegate>//3.遵循协议<让代理知道要执行的约定方法>

@end

@implementation ViewController
/**
 代理注意的点
 *分清驱动方和代理方法<前提条件>
  1.驱动方，声明协议，协议中约定方法
  2.驱动方，声明delegate属性 <付出的代价>
  3.代理方，遵循协议
  4.建立代理关系
  5.代理方，实现协议<协议中约定@required>方法,@optional选实现
  6.驱动方，在合适的时间驱动代理执行协议方法
 */

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
//实现跳转
-(void)buttonClicked
{
    
    //创建视图控制器
    SecondViewController *svc = [[SecondViewController alloc]init];
    
    //4.建立代理关系
    svc.delegate = self;
    
    // 设置跳转动画类型
    svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //跳转到第二视图控制器
    [self presentViewController:svc animated:YES completion:nil];
}

//5.实现代理方法
-(void)showText:(NSString *)text
{
    UILabel *label = (id)[self.view viewWithTag:10];
    label.text = text;
}
//可选的协议方法，带返回值的
-(UIColor*)colorForShowText:(NSString *)text
{
    UILabel *label = (id)[self.view viewWithTag:10];
    label.text = text;
    return [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
