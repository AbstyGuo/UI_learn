//
//  CustomPageControl.m
//  UIScrollView_PageControl
//
//  Created by 夏婷 on 15/11/27.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "CustomPageControl.h"

@interface CustomPageControl ()
{
//    id  _target;//记录添加事件时，调用函数的对象
    SEL _action;//记录添加事件时调用的方法
}
@property(nonatomic, weak) id target;

@end


@implementation CustomPageControl


/*
 1.点击左边是，让自身的currentPage 减小1（如果不是最小0）
 2.点击右半段，让自身的currentPage 增加1 （如果不是最大值：self.numberOfPages -1）
 3.合适的时机，触发pageControl的事件
 4.实现循环，应该如果在最大值位置， 并且点击右半段时，重设currentPage=0; 如果在最小位置，在点击左半段，重设currentPage= self.numberOfPages -1;
 */
-(void)addTargetForPageControl:(id)target action:(SEL)action
{
    _target = target;
    _action = action;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //拿到点击的点
    UITouch *touch = touches.anyObject;
    //取到点击点在 自身视图中的位置
    CGPoint point = [touch locationInView:self];
    
    //点击点是否为左半段
    if (point.x < self.frame.size.width /2) {
        
        if(self.currentPage != 0)//不是第一页
        {
            self.currentPage --;
        }else
        {
            //重设为最大值
            self.currentPage = self.numberOfPages -1;
        }
    }else
    {
        //点击右半段
        if(self.currentPage == self.numberOfPages -1)//最后一张
        {
            self.currentPage = 0;
        }else
        {
            self.currentPage ++;
        }
    }
    
    //触发事件
    if (_target && [_target respondsToSelector:_action])
    {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        //触发事件
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
