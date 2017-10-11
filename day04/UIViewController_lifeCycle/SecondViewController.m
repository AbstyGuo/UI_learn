//
//  SecondViewController.m
//  UIViewController_lifeCycle
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "SecondViewController.h"

#import "MyHeaderFile.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    SHOW_FUNC
    return self;
}

//加载视图，为显示做准备，self.view是在这个函数中被创建的，是否调用这个函数的依据是self.view是否存在，self.view==nil，就调用，不等于nil就不调用
-(void)loadView
{
    //调用父类的loadView
    [super loadView];
    SHOW_FUNC
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 改变当前视图的背景颜色
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"返回上一个界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    SHOW_FUNC
}

//界面将要出现时调用的方法
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    SHOW_FUNC
}

//界面出现后调用的方法
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SHOW_FUNC
}

//界面将要消失时调用的方法
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    SHOW_FUNC
}

//视图消失后调用的方法
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

-(void)buttonClicked
{
    //自定义动画切换类型
    //初始化动画对象
    CATransition * transition = [[CATransition alloc]init];
    //设置动画执行时间
    transition.duration = 1;
    //设置动画类型
    transition.type = @"cube";
    //设置动画方向
    transition.subtype = @"fromLeft";
    //添加动画
    [self.view.window.layer addAnimation:transition forKey:nil];

    //回答上一个界面，模态视图切换方式，只能从哪来的，回到哪去
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
