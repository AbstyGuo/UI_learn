//
//  MyHeaderFooterView.m
//  UITableView_groups
//
//  Created by 夏婷 on 15/11/30.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "MyHeaderFooterView.h"

@implementation MyHeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self)
    {
        CGSize size = [UIScreen mainScreen].bounds.size;
        _Label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, 40)];
        self.backgroundColor = [UIColor greenColor];
        _Label.textColor = [UIColor whiteColor];
        _Label.font = [UIFont boldSystemFontOfSize:30];
        _Label.textAlignment = NSTextAlignmentCenter;
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor greenColor];
        self.backgroundView = view;
        [self.contentView addSubview:_Label];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
