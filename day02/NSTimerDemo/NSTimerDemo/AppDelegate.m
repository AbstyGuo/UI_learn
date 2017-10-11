//
//  AppDelegate.m
//  NSTimerDemo
//
//  Created by student on 15-11-16.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

-(void)dealloc
{
    //当 当前对象被销毁时，要销毁定时器
    if (_timer != nil) {
        //销毁定时器
        [_timer invalidate];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //创建并设置大小和位置
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 30)];
    //设置背景颜色
    label.backgroundColor=[UIColor redColor];
    //设置文字
    label.text = @"求带走";
    //居中显示
    label.textAlignment=NSTextAlignmentCenter;
    label.tag=10;
    [_window addSubview:label];
    
    //创建一个按钮控制定时器的暂停和重启
    UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.backgroundColor = [UIColor cyanColor];
    //设置普通状态的标题
    [button setTitle:@"暂停" forState:UIControlStateNormal];
    [button setTintColor:[UIColor blueColor]];
    
    //添加点击事件
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_window addSubview:button];
    [self createTimer];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)buttonClicked:(UIButton * )button
{
    if (_isRunning == YES) {
        //暂停定时器
        [_timer setFireDate:[NSDate distantFuture]];
//        _isRunning = NO;
        [button setTitle:@"开始" forState:UIControlStateNormal];
    }else
    {
        //重启定时器
        [_timer setFireDate:[NSDate distantPast]];
//        _isRunning==YES;
        [button setTitle:@"暂停" forState:UIControlStateNormal];
    }
    _isRunning = !_isRunning;
}

-(void)createTimer
{
    //创建定时器并启动
    //第一个参数：时间间隔
    //第二个参数:调用方法的对象
    //第三个参数：每一次执行调用的方法
    //第四个参数：调用时需要携带的信息，一般nil
    //第五个参数：是否重复
    _timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(everyTime) userInfo:nil repeats:YES];
    _isRunning = YES;
}

-(void)everyTime
{
    //找到label
    UILabel * label =(id)[_window viewWithTag:10];
    //取出移动之前的位置
    CGRect frame = label.frame;
    
    //做移动操作
    static int x = 1 , y = 1;//每次改变的偏移量
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    //超出屏幕的判断
    //横向，超出后往反方向移动
    if (frame.origin.x+frame.size.width>size.width||frame.origin.x < 0) {
        x*=-1;
    }
    //纵向超，出后往反方向移动
    if (frame.origin.y+frame.size.height>size.height||frame.origin.y < 20) {
        y*=-1;
    }
    
    //修改label的位置
    frame.origin.x += x;
    frame.origin.y += y;
    
    //重设label的frame
    label.frame=frame;
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
