//
//  ViewController.m
//  birdgeGame
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"
#import "subViewOfPage.h"

@interface ViewController ()
{
    UIScrollView * _scrollView;
    NSTimer * _timer;
    UILabel * _line;
    CGRect _frame1;
    CGRect _frame2;
    subViewOfPage * _sub1;
    subViewOfPage * _sub2;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
}

-(void)createScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 420, self.view.frame.size.width, self.view.frame.size.height-420)];
    _scrollView.contentSize = CGSizeMake(100*self.view.frame.size.width, self.view.frame.size.height-420);
    _scrollView.pagingEnabled = YES;
    _sub1 = [[subViewOfPage alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height-420)];
    _sub2 = [[subViewOfPage alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2,0, self.view.frame.size.width/2, self.view.frame.size.height-420)];
    _frame1=[_sub1 makeLabelWithRank:1];
    _frame2=[_sub2 makeLabelWithRank:9];
    [_scrollView addSubview:_sub1];
    [_scrollView addSubview:_sub2];
    [self.view addSubview:_scrollView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger index = _scrollView.contentOffset.x/_scrollView.frame.size.width;
    _line = [[UILabel alloc]initWithFrame:CGRectMake(_frame1.origin.x-index*self.view.frame.size.width+_frame1.size.width-3, _frame1.origin.y+420, 3, 0)];
    _line.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_line];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(lineRun) userInfo:nil repeats:YES];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_timer invalidate];
    [self lengthOFline];
    [self scrollMove];
}

-(void)scrollMove
{
    NSInteger index = _scrollView.contentOffset.x/_scrollView.frame.size.width;
    NSInteger x =_scrollView.frame.size.width*(index+1);
    NSInteger y = _scrollView.frame.size.height;
    _scrollView.contentOffset = CGPointMake(x,y);
    if (_sub2) {
        _sub1 = _sub2;
        _sub1.frame = CGRectMake(x,0, self.view.frame.size.width/2, self.view.frame.size.height-420);
        NSLog(@"%lu",x);
        _sub2 = [[subViewOfPage alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+x,0, self.view.frame.size.width/2, self.view.frame.size.height-420)];
        NSLog(@"%f",_sub2.frame.origin.x);
        _frame1 = _sub1.frame;
        _frame2=[_sub2 makeLabelWithRank:9];
        [_scrollView addSubview:_sub2];
        [_scrollView addSubview:_sub1];
    }
    [_line removeFromSuperview];
}

-(void)lineRun{
    CGRect frame = _line.frame;
    frame.origin.y-=5;
    frame.size.height+=5;
    _line.frame = frame;
}
-(void)lengthOFline{
    CGRect frame = _line.frame;
    _line.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.height, frame.size.width);
    NSLog(@"%f,%f",_line.frame.origin.x,_line.frame.origin.y);
//    return _line.frame.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
