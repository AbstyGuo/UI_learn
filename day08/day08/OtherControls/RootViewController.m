//
//  RootViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
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
    NSArray *array = @[@"UIAlertView",@"UIActionSheet",@"UITextView",@"UIActivityIndicatorView",@"UIStepper",@"UISegmentedControl",@"UIProgressView",@"UISwitch",@"UISlider"];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        //设置位置和大小
        button.frame = CGRectMake(50, 100 + i * 50, self.view.frame.size.width - 100, 40);
        //设置标题
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        //设置标题颜色
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}
-(void)buttonClicked:(UIButton *)button
{
    //得到要创建的视图控制器的类名
    NSString *className = [NSString stringWithFormat:@"%@ViewController",button.titleLabel.text];
    //得到对应的类
    Class aClass = NSClassFromString(className);
    //创建视图控制器
    BaseViewController *vc = [[aClass alloc]init];
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
