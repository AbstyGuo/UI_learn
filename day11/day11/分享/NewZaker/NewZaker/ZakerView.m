//
//  ZakerView.m
//  NewZaker
//
//  Created by OS on 13-8-21.
//  Copyright (c) 2013年 夏婷. All rights reserved.
//

#import "ZakerView.h"

#define itemHight 95
#define itemWith 70
@implementation ZakerView
@synthesize index = _index;
@synthesize titleText = _titleText;
@synthesize button = _button;
@synthesize point = _point;
@synthesize delegate = _delegate;
@synthesize titleLabel = _titleLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTitle:(NSString *)title atIndex:(NSInteger)aIndex
{
    self = [super initWithFrame:CGRectMake(0, 0, itemWith, itemHight)];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:0 green:0.65 blue:0.9 alpha:1];
        self.backgroundColor = [UIColor clearColor];
        _titleText = title;
        _index = aIndex;
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-25)];
        [_button setBackgroundColor:[UIColor clearColor]];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _button.frame.size.height+2, self.frame.size.width, 20)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = _titleText;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
//        [_button setTitle:_titleText forState:UIControlStateNormal];
        
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressed:)];
        [self addGestureRecognizer:longPress];
        longPress = nil;
    }
    return self;
}
-(id)initWithTitle:(NSString *)title atIndex:(NSInteger)aIndex AndImage:(NSString *)ImageName
{
    self = [super initWithFrame:CGRectMake(0, 0, itemWith, itemHight)];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:0 green:0.65 blue:0.9 alpha:1];
        [self setBackgroundColor:[UIColor clearColor]];
        _titleText = title;
        _index = aIndex;
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-25)];
        [_button setBackgroundColor:[UIColor clearColor]];
//        [_button setTitle:_titleText forState:UIControlStateNormal];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _button.frame.size.height+2, self.frame.size.width, 20)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = _titleText;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];

        [_button setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressed:)];
        [self addGestureRecognizer:longPress];
        longPress = nil;
    }
    return self;

}
-(void)setTitleText:(NSString *)title andImage:(NSString *)ImageName
{
    [_button setImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    [_button setTitle:title forState:UIControlStateNormal];
    
}
-(void)clickItem:(UILongPressGestureRecognizer *)gestureRecognizer
{
    NSLog(@"in Zaker ItemClicked");
    [_delegate zakerItemDidClicked:self];
}
-(void)longPressed:(UILongPressGestureRecognizer *)gestureRecognizer
{
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            _point = [gestureRecognizer locationInView:self];
            NSLog(@"zakerItem长按开始");
            
            break;
        case UIGestureRecognizerStateChanged:
            
            [_delegate zakerItemDidMoved:self WithLocation:_point moveGestureReconizer:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
            _point = [gestureRecognizer locationInView:self];
            [_delegate zakerItemDidEndMoved:self WithLocation:_point moveGestureReconizer:gestureRecognizer];
            break;
        default:
            break;
    }
}

-(void)removeFromSuperview
{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
        [self setFrame:CGRectMake(self.frame.origin.x+50, self.frame.origin.y+50, 0, 0)];
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
