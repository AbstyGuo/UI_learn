//
//  ViewController.m
//  day10_homeWork
//
//  Created by MS on 15-11-27.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIPageControl * _pageControl;
    NSInteger _oldIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
    [self createPageControl];
}

#pragma mark - 创建滚动视图
-(void)createScrollView
{
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scroll.pagingEnabled = YES;
    scroll.delegate = self;
    scroll.tag = 100;
    [self.view addSubview:scroll];
    for (int i=0; i<17; i++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i*scroll.frame.size.width, 0, scroll.frame.size.width, scroll.frame.size.height);
        NSString * imageName =[NSString stringWithFormat:@"圣斗士%02d",i];
        if (i==0) {
            imageName =@"圣斗士15";
        }else if(i==16)
        {
            imageName=@"圣斗士01";
        }
        NSString * path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"jpg"];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        imageView.image = image;
        [scroll addSubview:imageView];
    }
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(17*scroll.frame.size.width, scroll.frame.size.height);
    scroll.contentOffset = CGPointMake(scroll.frame.size.width, 0);
}


-(void)createPageControl
{
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.frame = CGRectMake(0, self.view.frame.size.height-70, self.view.frame.size.width, 50);
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.alpha = 0.5;
    _pageControl.numberOfPages = 15;
    _oldIndex = 0;
    _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pageControl];
}

-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    UIScrollView * sc = (id)[self.view viewWithTag:100];
    //设置偏移量，滚动到对应的图片位置
    if(_oldIndex == pageControl.currentPage)//判断是否出现两次一样的currentPage
    {
        if(_oldIndex == 0)
        {//如果在头的话，跳到尾
            pageControl.currentPage = pageControl.numberOfPages-1;
        }else
        {//如果在尾的话，跳到头
            pageControl.currentPage = 0;
        }
    }

    sc.contentOffset = CGPointMake((pageControl.currentPage+1)*sc.frame.size.width, 0);
    _oldIndex = pageControl.currentPage;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前显示的图片是第几张
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    if(index == 0)
    {
        index = 15 ;
    }else if (index==16) {
        index=1;
    }
    //修改pagecontrol的显示页面
    _pageControl.currentPage = index-1;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算当前显示的图片是第几张
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    if(index == 0)
    {
        index = 15 ;
        //重置偏移量
        scrollView.contentOffset = CGPointMake(15*scrollView.frame.size.width, 0);
    }else if (index==16) {
        index=1;
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
    //修改pagecontrol的显示页面
   // _pageControl.currentPage = index-1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
