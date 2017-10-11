//
//  RootViewController.m
//  UIScrollView_pageControl
//
//  Created by students on 15/9/23.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "RootViewController.h"
#import "CustomPageControl.h"

static NSInteger oldIndex = 0;

@interface RootViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;//页面控件
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createScrollView];
    [self createPageControl];
}
#pragma mark - 关于PageControl
-(void)createPageControl{
    //创建_pageControl,通常与ScrollView一起使用
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 40)];
//    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.alpha = 0.5;
    //总页数
    _pageControl.numberOfPages = 10;
    //当前选中的页
    _pageControl.currentPage = 0;
    //选中页的小圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //非选中页的小圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加自己实现的方法
//    [_pageControl addTargetForControl:self action:@selector(myPageChanged:)];
    
    [self.view addSubview:_pageControl];
}

//-(void)myPageChanged:(CustomPageControl *)pageControl{
//    UIScrollView *scrollView = (id)[self.view viewWithTag:50];
//    NSInteger index = _pageControl.currentPage;
////    if (index == 0 && scrollView.contentOffset.x == self.view.frame.size.width * 9) {
////        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 10, 0);
////    }
//    scrollView.contentOffset = CGPointMake(index * self.view.frame.size.width, 0);
//      
//}
//
-(void)pageChanged:(UIPageControl *)pageControl{
    UIScrollView *scrollView = (id)[self.view viewWithTag:50];
    if (pageControl.currentPage - oldIndex != 0) {
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * (pageControl.currentPage + 1), 0);
        oldIndex = pageControl.currentPage;
    }else{
        if (oldIndex == 9) {
            scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
            oldIndex = 0;
            pageControl.currentPage = 0;
        }else{
            scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 10, 0);
            oldIndex = 9;
            pageControl.currentPage = 9;
        }
        
    }
}

#pragma mark - 关于滚动视图
-(void)createScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.tag = 50;
    [self.view addSubview:scrollView];
    //添加子视图
    for (int i = 0; i < 12; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        NSString *path;
        if (i == 0) {
            path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",10] ofType:@"png"];
        }else if (i != 11) {
            path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"png"];
        }else{
            path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",1] ofType:@"png"];
        }
        NSData *imageData = [NSData dataWithContentsOfFile:path];
        imageView.image = [[UIImage alloc] initWithData:imageData];
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 12, self.view.frame.size.height);
    scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    scrollView.pagingEnabled = YES;
    //滚动条不显示
    scrollView.showsHorizontalScrollIndicator = NO;
    
}
//减速结束,也就是停止滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageIndex = scrollView.contentOffset.x / self.view.frame.size.width;
    if (pageIndex == 11) {
        pageIndex = 1;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    }if (pageIndex == 0) {
        pageIndex = 10;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 10, 0);
    }
    _pageControl.currentPage = pageIndex - 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
