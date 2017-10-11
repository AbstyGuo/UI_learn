//
//  XTScrollView.m
//  UIScrollView_reuse
//
//  Created by 夏婷 on 15/11/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "XTScrollView.h"

#define NUM_PAGES 3   // 复用视图个数

@implementation XTScrollView
{
    NSInteger _totalPage;//将记录要显示的视图总个数
    NSInteger _currentPage;//记录当前显示的视图的下标
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //按页滚动
        self.pagingEnabled = YES;
        //隐藏横向滚动条
        self.showsHorizontalScrollIndicator = NO;
        //设置代理
        self.delegate = self;
        //当前显示子视图的下标初始值
        _currentPage = 0;
    }
    return self;
}
//刷新数据(即将要显示到窗口上时)，这时候才添加子视图
-(void)reloadData
{
    //通过数据源代理取到要显示的总页数
   _totalPage = [_dataSource numberOfPages];
    //无子视图时才添加子视图
    if(self.subviews.count == 0)
    {
        for(int i = 0; i< NUM_PAGES; i++)
        {
            //通过代理拿到子视图
            UIView *subView = [_subViewDelegate viewAtIndex:i];
            //重设子视图的frame
            subView.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
            //刷新显示内容
            [_dataSource refreshView:subView atIndex:i];
            //添加到滚动视图上
            [self addSubview:subView];
        }
    }
    //设置contentSize
    self.contentSize = CGSizeMake(self.frame.size.width * NUM_PAGES, self.frame.size.height);
    
}

#pragma mark - 滚动的协议方法
//停止减速，也就是滚动结束，计算当前显示子视图的下标
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //index可能出现的值0、1、2
    NSInteger index = scrollView.contentOffset.x/ scrollView.frame.size.width;
    
    switch (index) {
        case 0:
        {
            //只要不是第一张，刷新上一张，
            if (_currentPage !=0 ) {
                //如果是从最后一张跳转到倒数第二张时，少了一次 --
                if(_currentPage == _totalPage -1)
                {
                    _currentPage--;
                }
                _currentPage --;
            }
        }
            break;
        case 2:
        {
            // 如果不是最后一张，即将显示下一页
            if (_currentPage != _totalPage -1) {
                //当从第一张跳转到第二张时，少了一次++
                if(_currentPage == 0)
                {
                    _currentPage ++;
                }
                _currentPage ++;
            }
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
    
    [self refreshData];
    
}
//刷新显示数据
-(void)refreshData
{
    if(_currentPage == 0)//如果显示的时第一张
    {
        // 刷新第一个子视图
        [_dataSource refreshView:self.subviews[0] atIndex:0];
        // 刷新第二个子视图
        [_dataSource refreshView:self.subviews[1] atIndex:1];
        // 刷新第三个子视图
        [_dataSource refreshView:self.subviews[2] atIndex:2];
        return;
    }else if(_currentPage == _totalPage -1)//最后一张
    {
        // 刷新第三个子视图
        [_dataSource refreshView:self.subviews[2] atIndex:_totalPage - 1];
         // 刷新第二个子视图
        [_dataSource refreshView:self.subviews[1] atIndex:_totalPage - 2];
        // 刷新第一个子视图
        [_dataSource refreshView:self.subviews[0] atIndex:_totalPage - 3];
        return;
    }else
    {
        //刷新当前显示的子视图
        [_dataSource refreshView:self.subviews[1] atIndex:_currentPage];
        //刷新当前显示页的前一页
        [_dataSource refreshView:self.subviews[0] atIndex:_currentPage -1];
        //刷新当前显示页的下一页
        [_dataSource refreshView:self.subviews[2] atIndex:_currentPage +1];
        //修正偏移量,始终显示中间的一个子视图
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
}
#pragma mark -自己触发一次刷新
//要被放到窗口上显示时调用这个方法
-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    //触发一次刷新
    [self reloadData];
}






@end
