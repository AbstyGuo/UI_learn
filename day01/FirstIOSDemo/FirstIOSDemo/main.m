//
//  main.m
//  FirstIOSDemo
//
//  Created by student on 15-11-16.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    /**
     UIApplicationMain这个函数的功能
     *前两个，main函数参数
     
     *第三个参数：需要传入UIApplication（或其子类）的类名，这个函数(UIApplicationMain)会创建一个UIApplication(或其子类）的对象，这个对象会不断的监测操作系统对应用程序状态的改变，当操作系统改变应用程序的状态时，操作系统会给这个对象发送一个通知，这个对象根据通知委托代理执行相应的代理方法。
     *第四个参数：需要传入的是一个遵循<UIApplicationDelegate>协议的类名，这个函数会创建一个代理对象，这个代理对象是UIApplication或其子类对象的代理，这个代理对象接受UIApplication对象的委托，执行协议方法
     */
}
