//
//  AppDelegate.m
//  UILableDemo
//
//  Created by student on 15-11-16.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //UILable 继承与UIView的用于显示文字的标签控件
    UILabel * label =[[UILabel alloc]init];
    
    //设置frame：在坐标系中的起始位置和大小，起始位置指的是左上角在坐标系中的坐标点
    label.frame=CGRectMake(50, 20, 200, 50);
    
    //把labei添加到窗口上显示
    [_window addSubview:label];
    
    //设置背景颜色,参数是一个颜色对象。UIColor是一个颜色类
    label.backgroundColor=[UIColor redColor];
    
    //设置显示文字
    label.text=@"We are family!We are family!We are family!We are family!";
    
    //设置字体的颜色
    label.textColor =[UIColor whiteColor];
    //设置字体
    label.font=[UIFont systemFontOfSize:30];
    //设置粗体字
    label.font=[UIFont boldSystemFontOfSize:30];
    //设置斜体字,同一个属性的设置，后设置覆盖先设置
    label.font=[UIFont italicSystemFontOfSize:30];
    
    //获取iOS系统支持的字体。
    NSArray * familyNames=[UIFont familyNames];
    NSLog(@"%@",familyNames);
    
    //设置所有支持的字体的方法
    label.font=[UIFont fontWithName:@"Snell Roundhand" size:30];
    
    //设置文字对齐方式
    label.textAlignment=NSTextAlignmentLeft;
    /**
     NSTextAlignmentLeft    左对齐
     NSTextAlignmentRight   右对齐
     NSTextAlignmentCenter  居中
     */
    //字体自动适应label的宽度，文字只会缩小适应，不会放大
    label.adjustsFontSizeToFitWidth=YES;
    
    
    //设置最大显示行数,label高度狗显示几行就几行，文字够显示几行是几行
    label.numberOfLines=2;//设置为0时，最大行数没有限制
    
    //改变位置和大小
    label.frame=CGRectMake(30, 20, 250, 100);
    
    //换行模式
    label.lineBreakMode=NSLineBreakByClipping;
    /**
     NSLineBreakByWordWrapping 以单词换行，显示不下直接舍去尾端
     NSLineBreakByCharWrapping 以字符换行，不保证单词的完整性
     NSLineBreakByClipping     以单词换行，显示不下时，以字符作为舍去的单位
     NSLineBreakByTruncatingHead  以单词换行，如果显示不下，舍去最后一行行首部分，并用...代替舍去的内容
     NSLineBreakByTruncatingTail  以单词换行，如果显示不下，舍去最后一行尾端部分，并用...代替舍去的内容
     NSLineBreakByTruncatingMiddle 以单词换行，如果显示不下，舍去最后一行中间部分，并用...代替舍去的内容
     */
    
    //设置阴影文字，需要设置偏移量和颜色
    label.shadowOffset = CGSizeMake(5, 5);
    label.shadowColor = [UIColor darkGrayColor];
    
    //设置标记，保证唯一,通过父视图查找label
    label.tag=10;
    [self useLabel];
    
    //按当前设置的frame的宽度作为计算的最大宽度，高度根据文字多少变化，字体和字号已知，用attributedText这个属性显示文字，sizeToFit方法重绘label的显示范围
    //设置文字以及格式
    label.attributedText =[[NSAttributedString alloc]initWithString:label.text attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Snell Roundhand" size:30],NSForegroundColorAttributeName:[UIColor blueColor]}];
    [label sizeToFit];
    
//    //通过文字计算label的大小，1、通常宽度是固定的，字体和字号已知
//    //2、显示的字体和计算所用的字体必须一致
//    label.numberOfLines=0;
//    CGSize size =[label.text sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Snell Roundhand" size:30]}];
//    label.frame=CGRectMake(20, 100, size.width, size.height);
    

    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)useLabel
{
    UILabel * label =(UILabel *)[_window viewWithTag:10];
    label.backgroundColor=[UIColor greenColor];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
