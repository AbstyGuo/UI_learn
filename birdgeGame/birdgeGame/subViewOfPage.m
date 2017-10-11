//
//  subViewOfPage.m
//  birdgeGame
//
//  Created by MS on 15-12-3.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//



#import "subViewOfPage.h"

@implementation subViewOfPage
{
    UILabel * _label;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor blackColor];
        [self addSubview:_label];
    }
    return self;
}

-(CGRect)makeLabelWithRank:(int)rank
{
#define X arc4random()%50
#define WIDTH  arc4random()%21+22-rank*2
    int x = X, width = WIDTH;
    _label.frame = CGRectMake(x, 0, width,self.frame.size.height);
    return _label.frame;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
