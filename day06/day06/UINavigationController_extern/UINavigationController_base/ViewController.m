//
//  ViewController.m
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
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
    self.titleStr = @"第一层";
   
    
    [self navigationBarStyleSetting];//导航条样式的设置
}
-(void)navigationBarStyleSetting
{
    //导航条是属于导航控制器，一个导航控制器只有一个导航条，当前所显示的视图控制器可以设置导航条的样式和显示内容
    //取到导航条
    UINavigationBar *gationBar = self.navigationController.navigationBar;
    
    gationBar.barStyle = UIBarStyleBlackTranslucent;
    /*
     UIBarStyleDefault 白色半透明
     UIBarStyleBlack 黑色半透明
     UIBarStyleBlackOpaque 黑色
     UIBarStyleBlackTranslucent 黑色半透明
     */
    //设置是否半透明 YES 半透明，NO不透明
    //半透明时，视图的坐标原点是屏幕的左上角，不透明时，坐标点下移64个坐标点
    gationBar.translucent = NO;
    //设置导航条的背景图片
    [gationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    //第一个参数：图片对象
    //导航条的模式：
    /*
     UIBarMetricsDefault 纵屏不带备注
     UIBarMetricsCompact 横屏幕不带备注
     UIBarMetricsDefaultPrompt 纵屏带备注
     UIBarMetricsCompactPrompt 横屏带备注
     */
//    self.navigationItem.prompt = @"我是备注";
    //状态栏高度20，导航条的高度：44个坐标点高，注意设置背景图片时，图片的像素高度应该刚好是 44、88、132，如果是过小或过大，就会被拉伸或压缩为 64个坐标点高
    // 如果图片刚好是44、88、132 时，导航条是紧靠在状态栏下方的，否则状态栏浮在导航条上方
    
    //设置导航条的背景颜色
    gationBar.barTintColor = [UIColor magentaColor];
    //设置镂空部分的颜色
    gationBar.tintColor = [UIColor yellowColor];
}

//重写父类方法
-(void)buttonclicked
{
    //创建视图控制器
    SecondViewController *svc = [[SecondViewController alloc]init];
    //通过导航控制器，把svc 推入导航控制器中
    //第一个参数： 要推入的视图
    //第二个参数：是否需要动画
    [self.navigationController pushViewController:svc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
