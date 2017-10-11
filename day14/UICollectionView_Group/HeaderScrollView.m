//
//  HeaderScrollView.m
//  UICollectionView_Base
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "HeaderScrollView.h"

@implementation HeaderScrollView
{
    ADScrollView * _adView;//显示图片的滚动视图
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        _adView = [[ADScrollView alloc]initWithFrame:frame];
        [self addSubview:_adView];
    }
    return self;
}

-(void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    //刷新显示内容
    [_adView reloadDataWithImageArray:imageArray];
}

@end
