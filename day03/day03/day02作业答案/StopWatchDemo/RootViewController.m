//
//  RootViewController.m
//  StopWatchDemo
//
//  Created by 夏婷 on 15/11/18.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    int _h,_m,_s,_S;//记录定时时间的时、分、秒、0.1秒
    NSTimer *_timer;// 用来计时
    BOOL _isRunning;//记录定时器的计时状态
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self createLabels];
    [self createButtons];
    //设置初始值
    _h = _m = _s = _S = 0;
    _isRunning = NO;
    [self createTimer];
}
#pragma mark - 关于label
-(void)createLabels
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    // 创建显示时分秒的label
    UILabel *mainLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, size.width - 70, 80)];
    //设置字体颜色
    mainLabel.textColor = [UIColor blackColor];
    //设置字体
    mainLabel.font = [UIFont boldSystemFontOfSize:110];
    mainLabel.adjustsFontSizeToFitWidth = YES;
    mainLabel.text = @"00:00:00.";
    //设置标记
    mainLabel.tag = 10;
    [self.view addSubview:mainLabel];
    
    UILabel *tailLabel = [[UILabel alloc]init];
    //设置尾部label的位置和大小
    tailLabel.frame = CGRectMake(mainLabel.frame.origin.x + mainLabel.frame.size.width, mainLabel.frame.origin.y + 30, 60, 60);
    tailLabel.textColor = [UIColor redColor];
    tailLabel.font = [UIFont boldSystemFontOfSize:50];
    //设置字体自适应宽度
    tailLabel.adjustsFontSizeToFitWidth = YES;
    tailLabel.text = @"0";
    tailLabel.tag = 20;
    [self.view addSubview:tailLabel];
    
}
#pragma mark -关于按钮
-(void)createButtons
{
    NSArray *titleArray = @[@"【开始】",@"【停止】",@"【复位】"];
    CGSize size = [UIScreen mainScreen].bounds.size;
    for (int i = 0; i < titleArray.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(50, 250 + i * 80, size.width - 100, 50);
        //设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        //设置标题颜色
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.tag = 100 + i;
        //设置按钮标题的字体
        button.titleLabel.font = [UIFont boldSystemFontOfSize:50];
        [self.view addSubview:button];
        //把添加事件写到一个方法中
        [self addTargetForButton:button];
        
    }
    
}
-(void)addTargetForButton:(UIButton *)button
{
    //按钮的点击方法进行分发
    switch (button.tag - 100) {
        case 0:
        {
            [button addTarget:self action:@selector(startOrStopWatch:) forControlEvents:UIControlEventTouchDown];
        }
            break;
        case 1:
        {
            [button addTarget:self action:@selector(stopWatch) forControlEvents:UIControlEventTouchDown];
        }
            break;
        case 2:
        {
            [button addTarget:self action:@selector(resetWatch) forControlEvents:UIControlEventTouchDown];
        }
            break;
        default:
            break;
    }
}
//开始或暂停计时
-(void)startOrStopWatch:(UIButton *)button
{
    if(_isRunning == NO)
    {
        //启动定时器
        [_timer setFireDate:[NSDate distantPast]];
        _isRunning = YES;
        //修改标题
        [button setTitle:@"【暂停】" forState:UIControlStateNormal];
    }else
    {
        //停止定时器
        [_timer setFireDate:[NSDate distantFuture]];
        _isRunning = NO;
        [button setTitle:@"【继续】" forState:UIControlStateNormal];
    }
    
}
//结束计时
-(void)stopWatch
{
    UIButton *button1 = (id)[self.view viewWithTag:100];
    //停止定时器
    [_timer setFireDate:[NSDate distantFuture]];
    _isRunning = NO;
    //设置第一个按钮的标题
    [button1 setTitle:@"【开始】" forState:UIControlStateNormal];
    _h = _m = _s = _S = 0;
    
}
-(void)resetWatch
{
    [self stopWatch];
    [self showTime];
    
}
#pragma mark - 定时器相关的方法
-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(everyTime) userInfo:nil repeats:YES];
    //暂停定时器
    [_timer setFireDate:[NSDate distantFuture]];
}
-(void)everyTime
{
    _S++;
    if (_S == 10) {
        _s++;
        _S = 0;
        if (_s == 60) {
            _m++;
            _s = 0;
            if (_m == 60) {
                _h ++;
                _m = 0;
                if (_h == 100) {
                    [self stopWatch];
                }
            }
            
        }
    }
    [self showTime];
    
}
// 刷新显示的时间
-(void)showTime
{
    UILabel *mailLabel = (id)[self.view viewWithTag:10];
    UILabel *tailLabel = (id)[self.view viewWithTag:20];
    mailLabel.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d.",_h,_m,_s];
    tailLabel.text = [NSString stringWithFormat:@"%d",_S];
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
