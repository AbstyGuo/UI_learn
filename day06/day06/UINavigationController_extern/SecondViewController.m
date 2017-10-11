//
//  SecondViewController.m
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SecondViewController.h"

#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"第二层";
    //导航条上Item和文字等的设置
    [self navigationItemSetting];

}
-(void)navigationItemSetting
{
    UINavigationBar *gationBar = self.navigationController.navigationBar;
    //设置楼镂空部分的颜色
    gationBar.tintColor = [UIColor blueColor];
    //第一种创建方式，同过标题创建UIBarButtonItem
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithTitle:@"新增" style:UIBarButtonItemStyleDone target:self action:@selector(itemClicked:)];
    /*第一个参数： 标题
     第二参数:样式：Done, Plain
     第三个参数：点击UIBarButtonItem，调用方法的对象
     第四个参数：调用方法的名字
     */
    // 导航按钮属于当前视图控制器，不属于NavigationController
    self.navigationItem.leftBarButtonItem = item1;
    //第二种创建方式:采用系统提供的样式创建UIBarButtonItem
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(itemClicked:)];
    self.navigationItem.rightBarButtonItem = item2;
    
    // 第三种：通过图片创建UIBarButtonItem
    UIImage *image = [UIImage imageNamed:@"player_down_1"];
    //UIImageRenderingModeAlwaysOriginal 设置图片总是显示原色
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //iOS  7之后，用图片创建是显示图片轮廓
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:nil action:nil];
    //设置导航栏左按钮
    self.navigationItem.leftBarButtonItem = item3;
    
    //第四种：通过自定义视图创建UIBarButtonItem
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    //设置按钮图片
    [button setBackgroundImage:[UIImage imageNamed:@"player_down_2"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    //第四种：通过自定义视图创建UIBarButtonItem
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item4;
    //设置导航标题，这个有导航条显示在导航条上，如果是当前视图是由UITabBarController直接管理时，还可以显示在UITabBarItem上
    // 设置值必须与上一次不同，才会执行覆盖
    self.title = @"第二个界面";
    //专门显示在导航条上的，设置值无论是什么都会覆盖
    self.navigationItem.title = @"AAA";
//    self.title = @"第二个界面1";
//    self.navigationItem.title = @"AAA";
    //设置导航栏标题的字体、颜色等属性
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSForegroundColorAttributeName:[UIColor cyanColor]};
   
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
   //设置titleView
    [self.navigationItem setTitleView:label];
//    self.navigationItem.titleView = label;
    
    NSArray *leftItems = @[item1,item3];
    NSArray *rightItems = @[item2,item4];
    //设置左边多个Item,显示顺序，从左到右对应数组中得顺序
    self.navigationItem.leftBarButtonItems = leftItems;
    //设置右边多个item，显示顺序，从右到左，对应数组中得顺序
    self.navigationItem.rightBarButtonItems = rightItems;
}
-(void)itemClicked:(UIBarButtonItem *)item
{
    
}

-(void)buttonclicked
{
    ThirdViewController *tvc = [[ThirdViewController alloc]init];
    //target：调用函数的对象
    //action：调用方法的名字
    UIBarButtonItem *item5 = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:tvc action:@selector(backItemClicked:)];
    
    UIImage *image = [UIImage imageNamed:@"player_down_3"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //通过图片创建返回Item
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:tvc action:@selector(backItemClicked:)];
    //用系统样式创建
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    //设置返回Item，是在当前页面设置，在下一个界面显示
    //只支持通过标题和图片创建两种方式，如果是通过系统样式或者customView方式创建的Item，设置为backBarButtonItem是不生效的
    self.navigationItem.backBarButtonItem = item1;
    
    //推出第三层视图
    [self.navigationController pushViewController:tvc animated:YES];
    
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
