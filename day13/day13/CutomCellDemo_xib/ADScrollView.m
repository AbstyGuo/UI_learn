//
//  ADScrollView.m
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ADScrollView.h"

@implementation ADScrollView 
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UILabel *_showLabel;//显示描述信息
    NSMutableArray *_imageArray;// 存放显示的图片名字
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self createSubViews];
    
    }
    return self;
}
-(void)createSubViews
{
    //创建滚动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    //指定代理
    _scrollView.delegate = self;
    
    //设置按页滚动
    _scrollView.pagingEnabled = YES;
    
    //隐藏滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    //创建PageControl并设置frame
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 40)];
    //设置背景颜色
    _pageControl.backgroundColor = [UIColor blackColor];
    //设置透明度
    _pageControl.alpha = 0.5;
    //普通小圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    //选中的小圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    _pageControl.currentPage = 0;
    
    //添加事件
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_pageControl];
    
    
    
    _showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _pageControl.frame.origin.y, 100, 40)];
    //设置文字颜色
    _showLabel.textColor = [UIColor whiteColor];
    
    _showLabel.font = [UIFont systemFontOfSize:16];
    _showLabel.backgroundColor = [UIColor clearColor];
    //居中对齐
    _showLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_showLabel];
}

//刷新显示的图片和其他信息
-(void)reloadDataWithImageArray:(NSArray *)array
{
    
    for (UIView * subView in _scrollView.subviews)
    {
        //移除所有的子视图
        [subView removeFromSuperview];
    }
    int i = 0;
    //添加子视图
    for(NSString *imageName in array)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        
        NSArray *nameArray = [imageName componentsSeparatedByString:@"."];
        //获取图片路径
        NSString *path = [[NSBundle mainBundle] pathForResource:nameArray[0] ofType:nameArray[1]];
        //读取图片数据
        NSData *imageData = [NSData dataWithContentsOfFile:path];
        //显示到图片视图
        imageView.image = [[UIImage alloc]initWithData:imageData];
        [_scrollView addSubview:imageView];
        i++;
    }
    //设置显示尺寸
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * array.count, _scrollView.frame.size.height);
    //设置当前页码
    _pageControl.currentPage = 0;
    
    //设置总张数
    _pageControl.numberOfPages = array.count;
    
    //显示图片名字
    if (array.count >=1) {
        _showLabel.text = [array objectAtIndex:0];
    }
    
    if (_imageArray == nil) {
        
        _imageArray = [[NSMutableArray alloc]init];
    }
    [_imageArray removeAllObjects];
    //添加新的图片名字
    [_imageArray addObjectsFromArray:array];
}

#pragma mark - 滚动结束
//结束减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算滚动的页码
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    _pageControl.currentPage = index;
    _showLabel.text = [_imageArray objectAtIndex:index];
    
}

-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    //刷新图片名字
    _showLabel.text = [_imageArray objectAtIndex:pageControl.currentPage];
    
    //滚动到相应的位置
    _scrollView.contentOffset = CGPointMake(pageControl.currentPage * _scrollView.frame.size.width, 0);
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
