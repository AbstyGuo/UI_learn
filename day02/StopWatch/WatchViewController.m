//
//  WatchViewController.m
//  StopWatch
//
//  Created by student on 15-11-17.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "WatchViewController.h"

@interface WatchViewController ()
{
    NSTimer * _timer;
    BOOL _isStart;
    BOOL _isRunning;
}
@end

@implementation WatchViewController

-(void)dealloc
{
    //当 当前对象被销毁时，要销毁定时器
    if (_timer != nil) {
        //销毁定时器
        [_timer invalidate];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 220, 60)];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"00:00:00.";
    label1.font = [UIFont systemFontOfSize:45];
    label1.textAlignment = NSTextAlignmentRight;
    label1.adjustsFontSizeToFitWidth = YES;
    label1.tag =10;
    label1.textColor = [UIColor whiteColor];
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(250 , 100 , 40 , 60)];
    label2.backgroundColor =[UIColor redColor];
    label2.text = @"0";
    label2.font = [UIFont systemFontOfSize:32];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.adjustsFontSizeToFitWidth = YES;
    label2.tag =20;
    label2.textColor = [UIColor whiteColor];
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    _isStart = YES;
    
    
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(110, 260, 100, 40)];
    button1.backgroundColor =[UIColor grayColor];
    [button1 setTitle:@"开始" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.tag = 30;
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [[UIButton alloc]initWithFrame:CGRectMake(110, 340, 100, 40)];
    button2.tag = 40;
    button2.backgroundColor =[UIColor grayColor];
    [button2 setTitle:@"停止" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton * button3 = [[UIButton alloc]initWithFrame:CGRectMake(110, 420, 100, 40)];
    button3.tag =50;
    [button3 setTitle:@"复位" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3
    .backgroundColor =[UIColor grayColor];
    [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

-(void)buttonClicked:(UIButton *)sender
{
    if (sender.tag==30)
    {
        if (_isStart==YES) {
            [self reset];
            _isStart=NO;
        }
        if (_isRunning == NO) {
            [sender setTitle:@"暂停" forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
//            _isStart=YES;
        }else
        {
            [_timer setFireDate:[NSDate distantFuture]];
            [sender setTitle:@"继续" forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            _isStart=NO;
        }
        _isRunning = !_isRunning;

    }else if (sender.tag==40)
    {
        UIButton * button = (id)[self.view viewWithTag:30];
        [_timer setFireDate:[NSDate distantFuture]];
        [button setTitle:@"开始" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _isRunning =NO;
        _isStart=YES;
        
    }else if (sender.tag==50)
    {
        UIButton * button = (id)[self.view viewWithTag:30];
        [button setTitle:@"开始" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (_timer != nil) {
            //销毁定时器
            [_timer invalidate];
        }
        [self reset];
        _isRunning =NO;
    }
}

-(void)reset
{
    UILabel * label1 = (id)[self.view viewWithTag:10];
    UILabel * label2 = (id)[self.view viewWithTag:20];
    label1.text = @"00:00:00.";
    label2.text = @"0";
}

-(void)changeTime
{
    UILabel * label1 = (id)[self.view viewWithTag:10];
    UILabel * label2 = (id)[self.view viewWithTag:20];
    int x=[label2.text intValue];
    NSArray * arr = [label1.text componentsSeparatedByString:@":"];
    int y=[arr[0] intValue], z = [arr[1] intValue], m = [arr[2] intValue];
    if (x<9) {
        x++;
    }else if (m<59)
    {
        x=0;
        m++;
    }else if (z<59)
    {
        x=0,m=0;
        z++;
    }else if (y<99)
    {
        x=0,m=0,z=0,y++;
    }else{
        x=0,m=0,z=0,y=0;
    }
    label1.text=[NSString stringWithFormat:@"%02d:%02d:%02d.",y,z,m];
    label2.text=[NSString stringWithFormat:@"%d",x];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
