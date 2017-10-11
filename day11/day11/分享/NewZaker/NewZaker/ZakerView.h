//
//  ZakerView.h
//  NewZaker
//
//  Created by OS on 13-8-21.
//  Copyright (c) 2013年 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZakerViewDelegate;

@interface ZakerView : UIView

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, strong) UIImageView *zakerImage;
@property (nonatomic, assign) id<ZakerViewDelegate> delegate;
@property (nonatomic, strong) UILabel *titleLabel;
-(id)initWithTitle:(NSString *)title atIndex:(NSInteger)aIndex;
-(id)initWithTitle:(NSString *)title atIndex:(NSInteger)aIndex AndImage:(NSString *)ImageName;

@end

@protocol ZakerViewDelegate <NSObject>
-(void)zakerItemDidClicked:(ZakerView *)zakerItem;
-(void)zakerItemDidMoved:(ZakerView *)zakerItem WithLocation:(CGPoint)point moveGestureReconizer:(UILongPressGestureRecognizer *)recognizer;
-(void)zakerItemDidEndMoved:(ZakerView *)zakerItem WithLocation:(CGPoint)point moveGestureReconizer:(UILongPressGestureRecognizer *)recognizer;

@end
