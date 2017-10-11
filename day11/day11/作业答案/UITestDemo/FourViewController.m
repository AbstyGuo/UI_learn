//
//  FourViewController.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView1;
    UIScrollView *_scrollView2;
    UIScrollView *_scrollView3;
}

@end

@implementation FourViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"changeColor" object:nil];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createScrollViews];

}
-(void)createScrollViews
{
    _scrollView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 100)];
    _scrollView1.delegate = self;
    _scrollView1.contentSize = CGSizeMake(10 * _scrollView1.frame.size.width, _scrollView1.frame.size.height);
    _scrollView1.backgroundColor = [UIColor redColor];
    _scrollView1.pagingEnabled = YES;
    
    for (int i = 0; i <10; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * _scrollView1.frame.size.width, 35, _scrollView1.frame.size.width, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:20];
        label.text = [NSString stringWithFormat:@"%d只青蛙",i + 1];
        label.textColor = [UIColor blackColor];
        [_scrollView1 addSubview:label];
    }
    [self.view addSubview:_scrollView1];
  
    _scrollView2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    _scrollView2.delegate = self;
    _scrollView2.contentSize = CGSizeMake(20 * _scrollView2.frame.size.width, _scrollView2.frame.size.height);
    _scrollView2.backgroundColor = [UIColor greenColor];
    for (int i = 0; i <20; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * _scrollView2.frame.size.width, 35, _scrollView2.frame.size.width, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:20];
        label.text = [NSString stringWithFormat:@"%d只公鸡",i + 1];
        label.textColor = [UIColor blackColor];
        [_scrollView2 addSubview:label];
    }
    _scrollView2.pagingEnabled = YES;
    [self.view addSubview:_scrollView2];
    
    _scrollView3 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 100)];
    _scrollView3.delegate = self;
    _scrollView3.contentSize = CGSizeMake(41 * _scrollView3.frame.size.width, _scrollView3.frame.size.height);
    _scrollView3.scrollEnabled = NO;
    _scrollView3.backgroundColor = [UIColor cyanColor];
    for (int i = 0; i <41; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * _scrollView3.frame.size.width, 35, _scrollView3.frame.size.width, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:20];
        label.text = [NSString stringWithFormat:@"%d条腿",i];
        label.textColor = [UIColor blackColor];
        [_scrollView3 addSubview:label];
    }
    [self.view addSubview:_scrollView3];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/scrollView.frame.size.width;
    if (scrollView == _scrollView1) {
        _scrollView3.contentOffset = CGPointMake(_scrollView3.frame.size.width * (page +1) *4, 0);
    }
    if (scrollView == _scrollView2) {
        _scrollView3.contentOffset = CGPointMake(_scrollView3.frame.size.width * (page +1) *2, 0);

    }
}
-(void)changeColor:(NSNotification *)notify
{
    UIColor *color = notify.object;
    self.view.backgroundColor = color;
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
