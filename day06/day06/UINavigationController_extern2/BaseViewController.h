//
//  BaseViewController.h
//  UINavigationController_base
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//公开按钮点击时调用的方法，子类重写，并实现不同的功能
-(void)buttonclicked;
//声明属性
@property (nonatomic, copy) NSString *titleStr;

@end
