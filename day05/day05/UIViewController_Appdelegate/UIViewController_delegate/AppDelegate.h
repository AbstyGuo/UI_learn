//
//  AppDelegate.h
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


// UIApplicationMain()会创建一个AppDelegate的单例，我们利用它来实现数据共享

// 用来存储输入文字
@property (nonatomic, copy) NSString *showText;

@property (strong, nonatomic) UIWindow *window;


@end

