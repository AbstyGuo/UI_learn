//
//  UIProgressViewViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIProgressViewViewController.h"

@interface UIProgressViewViewController ()
{
    UIProgressView *_progressView;//进度条
    NSTimer *_timer;
}
@end

@implementation UIProgressViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    
    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    _progressView.backgroundColor = [UIColor lightGrayColor];
    //设置进度条的高度
    _progressView.transform = CGAffineTransformMakeScale(1, 10);
    //设置镂空颜色
    _progressView.tintColor = [UIColor redColor];
    
    //设置当前的进度,默认是0,最大是1
    _progressView.progress = 0;
    //设置样式
    /*
     UIProgressViewStyleBar  // 条状样式
     UIProgressViewStyleDefault //默认样式
     */
    _progressView.progressViewStyle = UIProgressViewStyleBar;
    //设置图片
    UIImage *image = [[UIImage imageNamed:@"header_bg"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _progressView.progressImage = image;
    [self.view addSubview:_progressView];
    
    //创建并启动定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    
}
-(void)changeProgress
{
    //每0.1秒增加1%的进度
    if (_progressView.progress < 1) {
        _progressView.progress += 0.01;

    }else
    {
        //停止定时器
        [_timer setFireDate:[NSDate distantFuture]];
    }
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
