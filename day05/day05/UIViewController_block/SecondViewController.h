//
//  SecondViewController.h
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController
//驱动方，声明block  <找打杂工的付出的代价>
@property (nonatomic, copy) UIColor * (^showTextBlock)(NSString * text);


@property (nonatomic, copy) NSString *egStr;

@end
