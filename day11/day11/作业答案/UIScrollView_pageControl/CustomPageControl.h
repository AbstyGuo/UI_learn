//
//  CustomPageControl.h
//  UIScrollView_pageControl
//
//  Created by students on 15/9/23.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIPageControl
-(void)addTargetForControl:(id)target action:(SEL)action;
@end
