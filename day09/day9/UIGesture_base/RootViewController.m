//
//  RootViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
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
    //所有按钮的标题，放到数组
    NSArray * array = @[@"Touch", @"Tap", @"LongPress", @"Swipe", @"Pan", @"Rotation", @"Pich", @"Double",@"Shake"];
    for (int i = 0; i<array.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        // 设置位置和大小
        button.frame = CGRectMake(50, 150 + i * 50, self.view.frame.size.width - 100 , 40);
        
        button.backgroundColor = [UIColor blackColor];
        // 设置标题
        [button setTitle:array[i] forState:UIControlStateNormal];
        //设置标题颜色
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //添加事件
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}
#pragma mark - 点击按钮
-(void)buttonClicked:(UIButton *)button
{
    //拼接出视图控制器的类名
    NSString *className = [NSString stringWithFormat:@"%@ViewController",button.titleLabel.text];
    //得到视图控制器类
    Class vcClass = NSClassFromString(className);
    //创建相应的视图控制器
    BaseViewController *vc = [[vcClass alloc]init];
    //推出下一个视图控制器
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
