//
//  AppDelegate.m
//  FirstIOSDemo
//
//  Created by student on 15-11-16.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

//当应用程序被载入时，UIApplication对象委托它的代理执行这个方法，可以说它是iOS程序的入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //创建窗口，
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //设置窗口背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    //设置窗口作为程序的主窗口，并显示出来
    [self.window makeKeyAndVisible];
    NSLog(@"程序被载入");
    //UIApplicationMain中创建的UIApplication对象，取到它的代理
//    AppDelegate * delegate= application.delegate;
//    NSLog(@"代理对象的地址：%@",delegate);
//    NSLog(@"自身的地址:%@",self);
    //证明了两个对象的代理关系
    
    return YES;
}

//应用程序将要进入非活跃状态（后台）时调用这个方法
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"应用程序即将进入非活跃状态");
    //暂停正在进行的任务，定时器失效，暂停游戏
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//当应用程序进入后台模式时调用这个方法
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"应用程序已经进入后台");
    
    //释放共享的资源，保存用户数据，销毁定时器，保存足够的状态和用户信息，为程序再一次进入活跃状态做准备
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//当应用程序即将进入前台时，调用这个方法
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"应用程序即将进入前台");
    
    //准备进入前台的数据，为进入前台时刷新界面做准备
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//应用程序已经进入活跃状态时，调用这个方法
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"应用程序已经进入活跃状态");
    
    //重启进入非活跃状态时暂停的状态的任务、定时器、游戏
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//程序设置了后台不运行模式时，一旦进入后台就会调用这个函数，而不调用：- (void)applicationDidEnterBackground:(UIApplication *)application这个方法
- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"程序后台不运行，销毁程序");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//内存紧张时调用这个方法，
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //系统允许你在这个方法中进行一次补救，释放不必要的数据，大的内存，补救之后内存够用就不崩溃，补救失败之后再崩溃
    NSLog(@"内存紧张");
}
@end
