//
//  CustonPageControl.m
//  UIScorllView_PageControl
//
//  Created by MS on 15-11-27.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "CustonPageControl.h"

@interface CustonPageControl()
{
    SEL _action;//记录添加事件时调用的方法
}
//记录添加事件时调用函数的对象
@property(nonatomic,weak) id target;
@end

@implementation CustonPageControl

/*
 1.点击左边时，让自身的CurrentPage 减小1（如果不是最小0）
 2.点击右边时，让自身的CurrentPage 增加1（如果不是最大值：self.numberOfPages-1）
 3.合适的时机，触发PageControl的事件
 4.实现循环，如果在最大值位置，并且点击右边时，重设CurrentPage为0，在最小位置，并且点击左边时，重设CurrentPage为self.numberOfPages-1
 */

-(void)addTargetForPageControl:(id)target action:(SEL)action
{
    _target = target;
    _action = action;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //拿到点击的点
    UITouch * touch = touches.anyObject;
    //取到触摸或点击点在自身视图中的位置
    CGPoint point = [touch locationInView:self];
    //判断点击点是左半段还是右半段
    if(point.x<self.frame.size.width/2)
    {   //左半段，不是0的情况下减1
        if(self.currentPage!=0)
        {
            self.currentPage--;
        }else//是0的情况，跳到最大页
        {
            self.currentPage = self.numberOfPages-1;
        }
    }else
    {   //右半段，不是最大页的情况下加1
        if (self.currentPage!=self.numberOfPages-1) {
            self.currentPage++;
        }else//是最大值的情况下，值重置为0
        {
            self.currentPage=0;
        }
    }
    //触发事件
    if (_target&&[_target respondsToSelector:_action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
        [_target performSelector:_action withObject:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
