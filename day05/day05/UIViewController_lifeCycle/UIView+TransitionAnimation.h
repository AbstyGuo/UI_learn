//
//  UIView+TransitionAnimation.h
//  UIViewController_lifeCycle
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

//动画类型的枚举
typedef enum {
    AnimationTypeFade = 0,
    AnimationTypePush,
    AnimationTypeCube,
}AnimationType;

typedef enum {
    AnimationSubTypeFromLeft = 0,
    AnimationSubTypeFromRight,
    AnimationSubTypeFromTop,
    AnimationSubTypeFromBottom
    
}AnimationSubType;


@interface UIView (TransitionAnimation)


-(void)addTransition:(NSTimeInterval)duration animationType:(AnimationType)type subType:(AnimationSubType)subType;


@end
