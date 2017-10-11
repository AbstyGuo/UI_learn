//
//  ViewController.m
//  UIScrollView_PageControl
//
//  Created by 夏婷 on 15/11/27.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>//遵循滚动视图的协议
{
    UIPageControl * _pageControl;//记录当前显示的图片页码
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建滚动视图
    [self createScrollView];
    
    [self createPageControl];
    
}
#pragma mark 创建滚动视图
-(void)createScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    //设置标记
    scrollView.tag = 50;
    
    //指定代理
    scrollView.delegate = self;
    
    //设置起始位置和大小
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //按页滚动
    scrollView.pagingEnabled = YES;
    
    //隐藏横向滚动指示条
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];

    //添加滚动视图的子视图
    for (int i = 0; i < 10; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        //设置图片视图的位置和大小
        imageView.frame = CGRectMake(i * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        //图片名字
        NSString *imageName = [NSString stringWithFormat:@"%d",i + 1];
        //获取图片路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        //创建图片对象
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        //把图片放到图片视图上显示
        imageView.image = image;
        //把图片视图添加到scrollView上
        [scrollView addSubview:imageView];
        
    }
    //设置显示内容的尺寸
    scrollView.contentSize = CGSizeMake(10 * scrollView.frame.size.width, scrollView.frame.size.height);
}

#pragma mark - 滚动视图的协议方法


//结束减速，滚动停止
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    //计算出当前显示的图片是第几张
//    // 算出下标
//    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
//    //修改_pageControl的currentPage
//    _pageControl.currentPage = index;
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算出当前显示的图片是第几张
    // 算出下标
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    //修改_pageControl的currentPage
    _pageControl.currentPage = index;
}


#pragma mark - UIPageControl

-(void)createPageControl
{
    //UIPageControl 继承于UIControl,间接继承于UIView
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 70, self.view.frame.size.width, 50)];
    //设置背景颜色
    _pageControl.backgroundColor = [UIColor blackColor];
    
    //设置透明度
    _pageControl.alpha = 0.5;
    
    //设置总页数,默认0
    _pageControl.numberOfPages = 10;

    //设置当前选中页码
    _pageControl.currentPage = 4;
    
    //设置普通小圆点得颜色
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    //设置选中的小圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    //添加事件
    //Target:_pageControl.currentPage值发生变化，调用方法的对象
    //action:currentPage变化时，调用的方法
    //最后一个参数：触发时机
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventValueChanged];
    
    //添加到当前视图控制器的view上
    [self.view addSubview:_pageControl];
}
#pragma mark  UIPageControl的事件方法
-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    //找到滚动视图
    UIScrollView *sc = (id)[self.view viewWithTag:50];
    //设置偏移量，滚动到对应的图片位置
    sc.contentOffset = CGPointMake(sc.frame.size.width *pageControl.currentPage, 0);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
