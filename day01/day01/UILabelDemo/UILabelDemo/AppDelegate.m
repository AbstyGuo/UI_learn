//
//  AppDelegate.m
//  UILabelDemo
//
//  Created by 夏婷 on 15/11/16.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //UILabel 继承于UIView的用于显示文字的标签控件
    UILabel *label = [[UILabel alloc]init];
//    //设置frame：在坐标系中得起始位置和大小，起始位置指的时左上角在坐标系中得坐标点
//    label.frame = CGRectMake(20, 20, 300, 50);
//
//    //把label添加到窗口上显示
//    [_window addSubview:label];
//    //设置背景颜色,参数是一个颜色对象，UIColor 是一个颜色类
//    label.backgroundColor = [UIColor redColor];
//    
//    //设置显示文字
//    label.text = @"We are family !We are family !We are family !We are family !We are family !We are family !";
//    
//    //设置文字的颜色
//    label.textColor = [UIColor blueColor];
//    //设置字体
//    
//    label.font = [UIFont systemFontOfSize:30];
//    
//    //设置粗体字
//    label.font = [UIFont boldSystemFontOfSize:30];
//    
//    //设置斜体字，同一个属性的设置，后设置覆盖先设置
//    label.font = [UIFont italicSystemFontOfSize:30];
//    
//    //获取iOS系统支持的字体
//    NSArray *familyNames = [UIFont familyNames];
//    
//    NSLog(@"%@",familyNames);
//    //设置所有支持的字体的方法
//    label.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
//    //设置文字对齐方式
//    label.textAlignment = NSTextAlignmentLeft;
//    
//    
//    
//    
//    /*
//     NSTextAlignmentLeft 左对齐
//     NSTextAlignmentRight 右对齐
//     NSTextAlignmentCenter 居中
//     */
//    //字体自适应label的宽度,文字只会缩小适应，不会放大
////    label.adjustsFontSizeToFitWidth = YES;
//    
//    //设置最大显示行数，label的高度能显示几行是几行，文字够显示几行是几行，
//    label.numberOfLines = 0;//设置为0时，最大行数没有限制
//    
//    //改变位置和大小
//    label.frame = CGRectMake(20, 100, 300, 100);
//    //设置换行模式
//    label.lineBreakMode =  NSLineBreakByTruncatingMiddle;
//    /**
//     NSLineBreakByWordWrapping  以单词换行，显示不下，直接舍去尾端
//     NSLineBreakByCharWrapping 以字符换行，显示不下，直接舍去
//     NSLineBreakByClipping  以单词换行，显示不下时，以字符作为舍去的单位
//     n
//     NSLineBreakByTruncatingHead 以单词换行，如果显示不下，舍去最后一行行首部分，并用...代替舍去的内容
//     NSLineBreakByTruncatingTail 以单词换行，如果显示不下，舍去最后一行的尾端部分，并用...代替舍去的内容
//     NSLineBreakByTruncatingMiddle 以单词换行，如果显示不下，舍去最后一行的中间部分，并用...代替舍去的内容
//     
//     */
//    
//    
//    //设置阴影文字
//    //设置阴影文字的偏移量
//    label.shadowOffset = CGSizeMake(5, 5);
//    //设置阴影文字的颜色
//    label.shadowColor = [UIColor darkGrayColor];
//    //设置标记，保证唯一,通过父视图查找label
//    label.tag = 10;
//    [self useLabel];

    //第二种方式，按当前设置的frame的宽度作为计算的最大宽度，高度根据文字多少变化，字体和字号已知，用attributedText这个属性显示文字，sizeToFit方法重绘lable的显示范围
    
    //设置文字以及格式
    label.attributedText = [[NSAttributedString alloc]initWithString:@"We are family !We are family !We are family !We are family !We are family !We are family !" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Snell Roundhand" size:30],NSForegroundColorAttributeName:[UIColor blueColor]}];
     //重绘
    [label sizeToFit];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)useLabel
{
    UILabel *label =(UILabel *) [_window viewWithTag:10];
    label.backgroundColor = [UIColor redColor];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
