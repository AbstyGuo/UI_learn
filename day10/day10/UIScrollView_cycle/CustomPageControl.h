//
//  CustomPageControl.h
//  UIScrollView_PageControl
//
//  Created by 夏婷 on 15/11/27.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIPageControl

//提供一个方法，实现添加事件
-(void)addTargetForPageControl:(id)target action:(SEL)action;


@end
