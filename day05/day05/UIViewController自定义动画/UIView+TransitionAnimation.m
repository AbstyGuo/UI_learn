//
//  UIView+TransitionAnimation.m
//  UIViewControllerDemo1
//
//  Created by 夏婷 on 15/8/13.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIView+TransitionAnimation.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIView (TransitionAnimation)

-(void)setTrasitonAnimation:(TransitonAnimation)type duration:(NSTimeInterval)duration towardType:(TansitionAnimationTowardType)towardType
{
    NSArray *array = @[@"cameraIris",@"cube",@"pageCurl",@"pageUnCurl",@"rippleEffect",@"suckEffect",@"oglFlip",@"fade",@"moveIn",@"push",@"reveal"];
    NSArray *towardArray = @[@"fromLeft",@"fromRight",@"fromTop",@"fromBottom"];
    CATransition *transitin = [[CATransition alloc]init];
    //动画时间
    transitin.duration = duration;
    //设置动画类型
    transitin.type = array[type];
    //动画方向
    transitin.subtype = towardArray[towardType];
    [self.layer addAnimation:transitin forKey:nil];
    
}

@end
