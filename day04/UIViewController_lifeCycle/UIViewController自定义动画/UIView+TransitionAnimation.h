//
//  UIView+TransitionAnimation.h
//  UIViewControllerDemo1
//
//  Created by 夏婷 on 15/8/13.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  enum{
    TransitonAnimationCameraIris,
    TransitonAnimationCube,
    TransitonAnimationPageCurl,
    TransitonAnimationPageUnCurl,
    TransitonAnimationRippleEffect,
    TransitonAnimationSuckEffect,
    TransitonAnimationOglFlip,
    TransitonAnimationFade,
    TransitonAnimationMoveIn,
    TransitonAnimationPush,
    TransitonAnimationReveal,
    
}TransitonAnimation;

typedef enum {
    
    TansitionAnimationTowardTypeFromLeft,
    TansitionAnimationTowardTypeFromRight,
    TansitionAnimationTowardTypeFromTop,
    TansitionAnimationTowardTypeFromBottom

}TansitionAnimationTowardType;
@interface UIView (TransitionAnimation)


-(void)setTrasitonAnimation:(TransitonAnimation)type duration:(NSTimeInterval)duration towardType:(TansitionAnimationTowardType)towardType;
@end
