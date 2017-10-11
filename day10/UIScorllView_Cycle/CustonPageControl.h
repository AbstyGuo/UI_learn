//
//  CustonPageControl.h
//  UIScorllView_PageControl
//
//  Created by MS on 15-11-27.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustonPageControl : UIPageControl

//提供一个方法，实现添加事件，也可以重写addTaget方法
-(void)addTargetForPageControl:(id)target action:(SEL)action;

@end
