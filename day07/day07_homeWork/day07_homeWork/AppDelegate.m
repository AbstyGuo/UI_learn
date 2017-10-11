//
//  AppDelegate.m
//  day07_homeWork
//
//  Created by MS on 15-11-24.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    ViewController * vc1 = [[ViewController alloc]init];
    SecondViewController * vc2 = [[SecondViewController alloc]init];
    ThirdViewController * vc3 = [[ThirdViewController alloc]init];
    ForthViewController * vc4 = [[ForthViewController alloc]init];
    NSArray * viewControllers = @[vc1,vc2,vc3,vc4];
    
    UITabBarController * tab = [[UITabBarController alloc]init];
    tab.viewControllers = viewControllers;
    tab.tabBar.tintColor = [UIColor redColor];
    [self setTabBarStyle:tab];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:tab];
    _window.rootViewController.navigationController.navigationBar.titleTextAttributes =@{NSFontAttributeName:[UIFont boldSystemFontOfSize:23],NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self setRootNav:nav];
    _window.rootViewController = nav;
    return YES;
}


-(void)setTabBarStyle:(UITabBarController *)tab
{
    NSArray * viewControllers = tab.viewControllers;
    NSArray * array = @[@"订阅",@"热门",@"玩乐",@"社区"];
    for(int i=0;i<4;i++)
    {
        UIViewController * vc = viewControllers[i];
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@A",array[i]]];//创建选中时的图片
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * image1 = [UIImage imageNamed:[NSString stringWithFormat:@"%@B",array[i]]];//创建未选中时的图片
        image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem * item = [[UITabBarItem alloc]initWithTitle:array[i] image:image1 selectedImage:image];
        vc.tabBarItem = item;
    }
}

-(void)setRootNav:(UINavigationController *)nav
{
    nav.navigationBar.barTintColor = [UIColor redColor];
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
