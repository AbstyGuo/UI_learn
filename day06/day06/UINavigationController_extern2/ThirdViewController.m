//
//  ThirdViewController.m
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ThirdViewController.h"

#import "FourViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"第三层";
    [self toolbarStyleSetting];
    [self toolBarItemSetting];
    
}
//工具栏按钮的设置
-(void)toolBarItemSetting
{
    //取出toolBar,属于导航控制器
    UIToolbar *toolBar = self.navigationController.toolbar;
    //通过标题创建
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"标题" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIImage *image = [UIImage imageNamed:@"player_down_3"];
    //设置总是显示原色
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //通过图片创建
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:nil action:nil];
    //通过系统提供的样式
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    //通过CustomView:继承与UIView的子类的对象都可以
    

    
    //创建空白的item
    /*
     UIBarButtonSystemItemFixedSpace 自定义宽度
     UIBarButtonSystemItemFlexibleSpace 等宽留出空格
     */
    UIBarButtonItem *space1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    space1.width = 50;//UIBarButtonSystemItemFixedSpace
    UIBarButtonItem *space2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    space2.width = 50;//UIBarButtonSystemItemFixedSpace
    
    
    NSArray *items = @[item1,space1,item2,space2, item3];
    //设置工具栏item
    self.toolbarItems = items;
}

//工具栏的样式设置
-(void)toolbarStyleSetting
{
    //取出toolBar,属于导航控制器
    UIToolbar *toolBar = self.navigationController.toolbar;
    //设置工具栏风格
    toolBar.barStyle = UIBarStyleDefault;
    /*
     UIBarStyleDefault
     UIBarStyleBlack
     UIBarStyleBlackOpaque 
     UIBarStyleBlackTranslucent
     */
    //设置半透明或不透明
    toolBar.translucent = YES;
    //设置背景颜色
    toolBar.barTintColor = [UIColor orangeColor];
    //设置镂空部分的颜色
    toolBar.tintColor = [UIColor blueColor];
    //设置背景图片
    //第一个参数：图片对象
    //第二个参数：工具栏的位置，通常都是任意位置
    //第三个参数：模式，
    [toolBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    //工具栏的高度也是44个坐标点高
  
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置工具栏显示
    self.navigationController.toolbarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //设置工具栏隐藏
    self.navigationController.toolbarHidden = YES;

}



-(void)buttonclicked
{
    /*
    FourViewController *fvc = [[FourViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
     */
    ThirdViewController * tvc = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:tvc animated:YES];
    
}
-(void)backItemClicked:(UIBarButtonItem *)item
{
    //返回到上一层
    [self.navigationController popViewControllerAnimated:YES];
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
