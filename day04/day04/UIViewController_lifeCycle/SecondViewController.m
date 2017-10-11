//
//  SecondViewController.m
//  UIViewController_lifeCycle
//
//  Created by 夏婷 on 15/11/19.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SecondViewController.h"

#import "MyHeaderFile.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
//初始化
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //初始化父类
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        
    }
    SHOW_FUNC
    return self;
}
//加载视图，为显示做准备，self.view是在这个函数中创建的，是否调用这个函数的依据是self.view是否存在，self.view == nil,就调用，self.view != nil就不调用
-(void)loadView
{
    //调用父类的loadView
    [super loadView];
    SHOW_FUNC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //改变当前视图的背景颜色
    self.view.backgroundColor = [UIColor cyanColor];
    SHOW_FUNC
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    [button setTitle:@"回到上一个界面" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonCliked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}
//视图将要出现时，调用这个方法
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    SHOW_FUNC
}
//视图已经出现时调用这个方法
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SHOW_FUNC
}

// 界面将要消失时调用这个方法
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    SHOW_FUNC
}
//视图已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    SHOW_FUNC
}
//销毁
-(void)dealloc
{
    SHOW_FUNC
}

-(void)buttonCliked
{
    //回到上一个界面，模态视图切换方式，只能从哪来的，回哪去
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
