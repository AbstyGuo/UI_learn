//
//  UIView+TransitionAnimation.m
//  UIViewController_lifeCycle
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIView+TransitionAnimation.h"

@implementation UIView (TransitionAnimation)

-(void)addTransition:(NSTimeInterval)duration animationType:(AnimationType)type subType:(AnimationSubType)subType
{
    //动画类型的数组，AnimationType跟定义枚举的顺序要一致
    NSArray *typeArray = @[@"fade",@"push",@"cube"];
    NSArray *subTypeArray = @[@"fromLeft",@"fromRight",@"fromTop",@"fromBottom"];
    CATransition *transition = [[CATransition alloc]init];
    //设置动画时间
    transition.duration = duration;
    //设置动画类型
    transition.type = typeArray[type];
    //设置动画方向
    transition.subtype = subTypeArray[subType];
    [self.layer addAnimation:transition forKey:nil];
}

@end
