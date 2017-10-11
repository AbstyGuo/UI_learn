//
//  ViewController.m
//  UIScorllView_PageControl
//
//  Created by MS on 15-11-27.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIPageControl * _pageControl;//记录当前显示的图片页码
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建滚动视图
    [self createScrollView];
    [self createPageControl];
}

#pragma mark - 创建滚动视图
-(void)createScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    //设置起始位置和大小
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;//设置按页滚动
    scrollView.showsHorizontalScrollIndicator = NO;//隐藏横向滚动指示条
    scrollView.tag = 100;//设置标记
    scrollView.delegate = self;//指定代理
    [self.view addSubview:scrollView];
    //添加滚动视图的子视图
    for(int i = 0 ; i < 15; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]init];
        //设置图片视图的位置和大小
        imageView.frame = CGRectMake(i*scrollView.frame.size.width, 64, scrollView.frame.size.width, scrollView.frame.size.height);
        //图片名字
        NSString * imageName = [NSString stringWithFormat:@"%d",i+2];
        //获取图片路径
        NSString * path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
        //创建图片对象
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        imageView.image = image;//把图片添加到图片视图上
        //把图片视图放到scrollView上
        [scrollView addSubview:imageView];
        //设置显示内容的尺寸
        scrollView.contentSize = CGSizeMake(15*scrollView.frame.size.width, scrollView.frame.size.height);
    }
}

#pragma mark -滚动视图的协议方法
//滚动中进行计算
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前显示的图片是第几张
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    //修改pagecontrol的显示页面
    _pageControl.currentPage = index;
}
////结束减速，滚动停止
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    //计算当前显示的图片是第几张
//    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
//    //修改pagecontrol的显示页面
//    _pageControl.currentPage = index;
//}

#pragma mark - 页面控制器
-(void)createPageControl
{
    //UIPageControl 继承于UICortrol 间接继承于UIView
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-70, self.view.frame.size.width, 50)];
    //设置背景颜色
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.alpha = 0.5;//设置透明度
    //设置总页数，默认是0
    _pageControl.numberOfPages = 15;
    //设置当前选中页码
    _pageControl.currentPage = 0;
    //设置普通小圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    //设置选中的小圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    //target:_pageControl.currentPage值发生变化时，调用方法的对象
    //action:发生变化时调用的方法
    //forControlEvents:触发时机
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
}

#pragma mark -UIPageControl的事件方法
-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    UIScrollView * scrollView = (id)[self.view viewWithTag:100];
    //设置偏移量，滚动到对应的图片位置
    scrollView.contentOffset = CGPointMake(scrollView.frame.size.width*pageControl.currentPage, 0);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
