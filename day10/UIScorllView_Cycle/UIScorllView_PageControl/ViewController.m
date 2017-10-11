//
//  ViewController.m
//  UIScorllView_PageControl
//
//  Created by MS on 15-11-27.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"
#import "CustonPageControl.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    CustonPageControl * _pageControl;//记录当前显示的图片页码
    NSInteger _oldIndex;//记录上一次的页码
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
    for(int i = 0 ; i < 16; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]init];
        //设置图片视图的位置和大小
        imageView.frame = CGRectMake(i*scrollView.frame.size.width, 64, scrollView.frame.size.width, scrollView.frame.size.height);
        //图片名字
        NSString * imageName = [NSString stringWithFormat:@"%d",i+2];
        //在最后添加一张图片，造成循环的视觉效果
        if (i==15) {
            //最后一张图片，应与第一张一样
            imageName = [NSString stringWithFormat:@"%d",2];
        }
        //获取图片路径
        NSString * path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
        //创建图片对象
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        imageView.image = image;//把图片添加到图片视图上
        //把图片视图放到scrollView上
        [scrollView addSubview:imageView];
        //设置显示内容的尺寸
        scrollView.contentSize = CGSizeMake(16*scrollView.frame.size.width, scrollView.frame.size.height);
    }
}

#pragma mark -滚动视图的协议方法
//滚动中进行计算
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前显示的图片是第几张
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    if(index == 15)
    {
        index = 0 ;
        //重置偏移量
        scrollView.contentOffset = CGPointMake(0, 0);
    }
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
//    //UIPageControl 继承于UICortrol 间接继承于UIView
    _pageControl = [[CustonPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-70, self.view.frame.size.width, 50)];
    //设置背景颜色
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.alpha = 0.5;//设置透明度
    //设置总页数，默认是0
    _pageControl.numberOfPages = 15;
    //设置当前选中页码
    _pageControl.currentPage = 0;
    _oldIndex = 0;//初始显示页码
    //设置普通小圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    //设置选中的小圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    //target:_pageControl.currentPage值发生变化时，调用方法的对象
    //action:发生变化时调用的方法
    //forControlEvents:触发时机
//    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventTouchUpInside];
//自定义的添加方法
    [_pageControl addTargetForPageControl:self action:@selector(myPageIndexChanged:)];
    [self.view addSubview:_pageControl];
}

-(void)myPageIndexChanged:(UIPageControl *)pageControl
{
    UIScrollView * sc = (id)[self.view viewWithTag:100];
    sc.contentOffset = CGPointMake(pageControl.currentPage*sc.frame.size.width, 0);
}

#pragma mark -UIPageControl的事件方法
-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    UIScrollView * scrollView = (id)[self.view viewWithTag:100];
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
    scrollView.contentOffset = CGPointMake(scrollView.frame.size.width*pageControl.currentPage, 0);
    _oldIndex = pageControl.currentPage;//记录位置，供下一次判断
    NSLog(@"第%ld",pageControl.currentPage);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
