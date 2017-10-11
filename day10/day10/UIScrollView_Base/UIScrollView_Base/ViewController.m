//
//  ViewController.m
//  UIScrollView_Base
//
//  Created by 夏婷 on 15/11/27.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>//遵循滚动视图的协议

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    // 创建UIScrollView
    [self createScrollView];
    
}
#pragma mark -  创建滚动视图
-(void)createScrollView
{
    //创建ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    
    //指定代理
    scrollView.delegate = self;
    
    //设置位置大小（一次能显示的大小）
    scrollView.frame = self.view.bounds;
    //设置背景颜色
    scrollView.backgroundColor = [UIColor cyanColor];
    //
    [self.view addSubview:scrollView];
    
    //UIScrollView它能够容纳比自身frame范围大的视图，可以滚动的前提条件：
    //contentSize的尺寸比frame的大
    
    //创建ScrollView的子视图
    [self createSubViewsForScrollView:scrollView];
    //设置contentSize
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height * 3);
    //设置滚动指示条的样式
    scrollView.indicatorStyle =UIScrollViewIndicatorStyleWhite;
    /*
     UIScrollViewIndicatorStyleDefault,  黑色         UIScrollViewIndicatorStyleBlack, 黑色             UIScrollViewIndicatorStyleWhite 白色
     */
    //设置滚动指示条显示或隐藏,YES显示，NO隐藏
    //横向滚动指示条
    scrollView.showsHorizontalScrollIndicator = NO;
    //纵向滚动指示条
    scrollView.showsVerticalScrollIndicator = NO;
    //设置内容偏移量
//    scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    
    //设置偏移量，并且带动画
    [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
    
    //设置停止滚动后的减速加速度，设置越大停下来越慢，设置越小，停下来越快
//    scrollView.decelerationRate = 0.01;
    
    //设置按页滚动
    scrollView.pagingEnabled = NO;
    
    //当点击状态栏时，直接滚动到顶部，YES支持滚动到顶部，NO不支持
    scrollView.scrollsToTop = YES;
    //设置是否可超出边界
    scrollView.bounces = NO;
    //设置scrollView留出的边界尺寸，上、左,下,右
//    scrollView.contentInset = UIEdgeInsetsMake(64, 20, 0, 0);
    //UIViewController 的属性，当视图控制器的view中有且只有一个滚动视图时，能自动留出bar类型的空间，当有多个滚动视图时，不会留出，可以自己设置contentInset或frame
    self.automaticallyAdjustsScrollViewInsets = YES;
    //设置滚动视图是否可以滚动
    scrollView.scrollEnabled = YES;
    
    //最小缩放倍数
    scrollView.minimumZoomScale = 0.5;
    //最大缩放倍数
    scrollView.maximumZoomScale = 10;
}
#pragma mark - 给滚动视图添加子视图
-(void)createSubViewsForScrollView:(UIScrollView *)scrollView
{
    for(int i = 0; i < 4; i ++)
    {
        //创建图片视图
        UIImageView *imageView = [[UIImageView alloc]init];
        //设置图片视图在ScrollView中得位置和大小
        imageView.frame = CGRectMake((i % 2) * self.view.frame.size.width, (i / 2) *self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        //获取图片路径
        NSString * path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", i + 5] ofType:@"png"];
        //读取图片文件的数据
        NSData *imageData = [NSData dataWithContentsOfFile:path];
        //创建图片对象，显示在图片视图上
        UIImage *image = [[UIImage alloc]initWithData:imageData];
        imageView.image = image;
        //将图片视图添加到滚动视图上
        [scrollView addSubview:imageView];
        //设置标记
        imageView.tag = 200 + i;
    }
    
}

#pragma mark - 滚动视图的协议方法

#pragma mark -关于滚动
//将要开始拖拽时，调用这个方法，只要又可能引起contentOffset变化就会调用这个方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    NSLog(@"将要开始拖拽");
    //如果有其他视图，需要和scrollView进行联动时，应该在合格地方取到那个的初始位置
}
//已经滚动时调用这个方法，只要contentOffset发生改变就会调用这个方法，多次调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static int i = 0;
    if (i < 10) {
        NSLog(@"滚动中");
        i++;
    }
    //在这函数中，应该让与scrollView联动的视图跟随滚动，滚动的距离 与scrollView滚动的距离成一定比例关系
}
//将要结束拖拽时调用这个方法，结束拖拽时的速度
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"将要将结束拖拽  结束时的速度：%@",NSStringFromCGPoint(velocity));
}
//已经结束拖拽时调用这个方法，decelerate是否将要减速，只要松手时，速度不为（0，0）才会减速;
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"已经结束拖拽， %@",decelerate ? @"将要减速" : @"不减速");
}
//将要开始减速，拖拽结束之后，如果有速度，才会调用此方法
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"将要开始减速");
}
//已经结束减速时调用这个方法，也就是已经停止滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@" 停止滚动");
    //在这个函数中，你可以取到scrollView的最后偏移量，根据需求，做相关的显示
}
//结束滚动的动画执行完时调用这个方法
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"滚动动画结束");
}
//当我们点状态栏时，是否允许滚动到顶部，YES允许，NO不允许
-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return NO;
}
//已经滚动到顶部时调用这个方法
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"已经滚动到顶部");
}


#pragma mark -关于缩放的协议方法

//返回需要进行缩放的子视图
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"返回需要进行缩放的子视图");
    UIImageView *imageView = (id)[self.view viewWithTag:200];
    return imageView;
}
//将要开始缩放是调用这个方法，view对应即将进行缩放的子视图
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"将要开始缩放");
    [scrollView bringSubviewToFront:view];
    //可以记录scrollView的起始缩放量，scrollView.zoomScale,用于之后对子视图的缩放比例计算
}
//缩放中调用这个方法，只有scrollView.zoomScale发生改变都会调用这个方法
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"缩放中");
    //对子视图进行相应的缩放
}
//已经结束缩放，最终的缩放倍数
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"结束缩放");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
