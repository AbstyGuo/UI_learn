//
//  CustomPageControl.m
//  UIScrollView_pageControl
//
//  Created by students on 15/9/23.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "CustomPageControl.h"

@interface CustomPageControl ()

@property (nonatomic, assign) id myTarget;
@property (nonatomic, assign) SEL method;

@end

@implementation CustomPageControl
-(void)addTargetForControl:(id)target action:(SEL)action{
    _myTarget = target;
    _method = action;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取触摸点
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    if (point.x < self.frame.size.width / 2) {
        if (self.currentPage > 0) {
            self.currentPage--;
        }
    }else{
        if (self.currentPage < self.numberOfPages - 1) {
            self.currentPage++;
        }else{
            self.currentPage = 0;
        }
    }
    if (_myTarget && [_myTarget respondsToSelector:_method]) {
        [self.myTarget performSelector:_method withObject:self];
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
