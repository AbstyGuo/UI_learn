//
//  MyCell.m
//  UICollectionView_Base
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
{
    IBOutlet UILabel * _titleLabel;//用于显示标题
    IBOutlet UIImageView * _imageView;//用于显示图片
}

//加载完xib文件之后会调用的方法
-(void)awakeFromNib
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    self.selectedBackgroundView = view;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];//添加子视图
    }
    return self;
}

- (void)createSubViews
{
    _titleLabel = [[UILabel alloc]init];
    //设置frame，放在网格顶端
    _titleLabel.frame = CGRectMake(0, self.frame.size.height- 30, self.frame.size.width,30);
    _titleLabel.textAlignment = NSTextAlignmentCenter;//居中
    _titleLabel.textColor = [UIColor blackColor];//黑色
    _titleLabel.font = [UIFont systemFontOfSize:20];//设置字体
    [self.contentView addSubview:_titleLabel];
    //建议把自己添加的子视图放在contentView上
    
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30);
    [self.contentView addSubview:_imageView];
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    self.selectedBackgroundView = view;//设置选中时的背景视图，所有继承于UIView的视图都可以作为背景视图
}
//通过set方法刷新显示文字
-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}
//通过set方法刷新显示图片
-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    NSArray * array = [imageName componentsSeparatedByString:@"."];
    //获取路径
    NSString * path = [[NSBundle mainBundle]pathForResource:array[0] ofType:array[1]];
    //读取并创建图片对象，将其显示到图片视图上
    NSData * data = [NSData dataWithContentsOfFile:path];
    _imageView.image = [UIImage imageWithData:data];
}

@end
