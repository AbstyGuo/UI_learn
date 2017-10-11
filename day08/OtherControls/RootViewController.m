//
//  RootViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    NSArray * array = @[@"UIAlertView",@"UIActionSheet",@"UITextView",@"UIActivityIndicatorView",@"UIStepper",@"UISegmentedControl",@"UIProgressView",@"UISwitch",@"UISlider"];
    for (int i=0; i<array.count; i++)
    {
        UIButton * button = [[UIButton alloc]init];
        button.frame = CGRectMake(50, 100+i*50, self.view.frame.size.width-100, 40);//设置位置和大小
        [button setTitle:array[i] forState:UIControlStateNormal];//设置标题
        button.backgroundColor = [UIColor blackColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置标题颜色
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)button
{
    NSString *className = [NSString stringWithFormat:@"%@ViewController",button.titleLabel.text];
    //得到对应的类
    Class aClass = NSClassFromString(className);
    //创建对应的视图控制器
    BaseViewController * vc = [[aClass alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
