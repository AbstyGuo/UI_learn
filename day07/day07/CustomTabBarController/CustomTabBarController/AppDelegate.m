//
//  AppDelegate.m
//  CustomTabBarController
//
//  Created by 夏婷 on 15/11/24.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "QFTabBarController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>//遵循协议

@end

@implementation AppDelegate

-(void)createTabController
{
    ViewController1 *vc1 = [[ViewController1 alloc]init];
    vc1.title = @"第一页";
    ViewController2 *vc2 = [[ViewController2 alloc]init];
    vc2.title = @"第二页";
    ViewController3 *vc3 = [[ViewController3 alloc]init];
    vc3.title = @"第三页";
    ViewController4 *vc4 = [[ViewController4 alloc]init];
    vc4.title = @"第四页";
    ViewController5 *vc5 = [[ViewController5 alloc]init];
    vc5.title = @"第五页";
    NSArray *array = @[vc1,vc2,vc3,vc4,vc5];
    
    //创建自定义的TabBarController

    QFTabBarController *tab = [[QFTabBarController alloc]init];
    tab.delegate = self;
    tab.viewControllers = array;
    
    tab.selectedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"index"];
    // 设置tab为窗口的根视图
    self.window.rootViewController = tab;
}
//选中某一个视图控制器之后调用的协议方法
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //获取选中视图控制器的下标
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"index"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    //作为程序的主窗口并显示出来
    [_window makeKeyAndVisible];
    [self createTabController];
    
    return YES;
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
