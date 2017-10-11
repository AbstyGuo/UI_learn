//
//  UIActivityIndicatorViewViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIActivityIndicatorViewViewController.h"

@interface UIActivityIndicatorViewViewController ()
{
    UIActivityIndicatorView * _activityView;//加载指示器
}
@end

@implementation UIActivityIndicatorViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _activityView.frame = CGRectMake(50, 50, 200, 200);
    //放到屏幕中央
    _activityView.center = self.view.center;
    
    //改变大小
    _activityView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    //添加到当前视图上
    [self.view addSubview:_activityView];
    //启动动画，动画一旦停止，_activityView就消失
    [_activityView startAnimating];
    
    //延迟5秒之后停止动画
    [_activityView performSelector:@selector(stopAnimating) withObject:nil afterDelay:5];
    //系统提供的一个加载指示器，属于UIApplication对象，可以设置它可见或不可见
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    /*
     UIActivityIndicatorViewStyleWhiteLarge, 大白
     UIActivityIndicatorViewStyleWhite, 小白
     UIActivityIndicatorViewStyleGray, 灰
     */
}
#pragma mark -视图将要消失
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 加载数据的视图消失或者取消数据请求时，隐藏应用的加载指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
