//
//  QFTabBarController.m
//  CustomTabBarController
//
//  Created by 夏婷 on 15/11/24.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "QFTabBarController.h"
#define TABBAR_H 55   //tabBar的高度
#define ItemCount 4   //视图控制器的个数

@interface QFTabBarController ()

@end

@implementation QFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //定制TabBar
    [self customTabBar];
}
-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    for (int i = 0; i < ItemCount; i++)
    {
        UIButton *btn = (id)[self.view viewWithTag:100 + i];
        if (btn.tag != 100 + selectedIndex) {
            btn.selected = NO;//取消选中状态
        }else
        {
            btn.selected = YES;
        }
    }
}
-(void)customTabBar
{
    //在定制之前，应隐藏系统的
    self.tabBar.hidden = YES;
    //
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIImageView *tabBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, size.height - TABBAR_H, size.width, TABBAR_H)];
    //打开用户响应机制
    tabBar.userInteractionEnabled = YES;
    //计算按钮的宽度
    CGFloat with = size.width / ItemCount;
    for(int  i = 0; i < ItemCount; i ++)
    {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(i * with, 0, with, TABBAR_H);
        //设置按钮标题
        [button setTitle:[NSString stringWithFormat:@"第%d页",i + 1] forState:UIControlStateNormal];
        NSString *imageName = [NSString stringWithFormat:@"tab_%d",i];
        //选中和高亮状态的图片
        NSString *imaegNameS = [NSString stringWithFormat:@"tab_c%d",i];
        //设置普通状态的图片
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        //设置选中状态的图片
        [button setImage:[UIImage imageNamed:imaegNameS] forState:UIControlStateSelected];
        //设置高亮状态的图片
        [button setImage:[UIImage imageNamed:imaegNameS] forState:UIControlStateHighlighted];
        // 设置标记
        button.tag = 100 + i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        [tabBar addSubview:button];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        //设置普通状态下得标题颜色
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //设置按钮的字体
        
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        //四个参数分别对应 上、左、下、右
        button.titleEdgeInsets = UIEdgeInsetsMake(37, 0, 0, 25);
        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 30, 0, 0);
        
        if (i == 0) {
            button.selected = YES;
        }
    }
    [self.view addSubview:tabBar];
    tabBar.image = [UIImage imageNamed:@"tab_bg"];
}

-(void)buttonClicked:(UIButton *)button
{
    for (int i = 0; i <ItemCount; i++)
    {
        UIButton *btn = (id)[self.view viewWithTag:100 + i];
        if (btn.tag != button.tag) {
            btn.selected = NO;
            //取消其他按钮的选中状态
        }
    }
    button.selected = YES;
    self.selectedIndex = button.tag - 100;
    if (self.delegate) {
        //调用已经选中某一个视图控制器的协议方法
        [self.delegate tabBarController:self didSelectViewController:self.viewControllers[button.tag - 100]];
    }
    

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
