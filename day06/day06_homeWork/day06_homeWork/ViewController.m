//
//  ViewController.m
//  day06_homeWork
//
//  Created by MS on 15-11-23.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"
#import "MainPhotoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImage * image = [UIImage imageNamed:@"rr_main_background.png"];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,40)];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar.png"]];
    
    //label.alpha = 0.05;
    [self.view addSubview:label];
    [self createButtons];
    [self createMoreButtons];
}

-(void)createButtons
{
    NSArray * array =@[@"   照片",@"  状态",@"  报到"];
    NSArray * array1 = @[@"rr_pub_takephoto.png",@"rr_pub_status.png",@"rr_pub_checkin.png"];
    
    for (int i=0; i<3; i++) {
        UIButton * button =[[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"chat_send_button.png"] forState:UIControlStateNormal];
        CGRect rect = [UIScreen mainScreen].bounds;
        button.frame = CGRectMake(10+i*rect.size.width/3,5 , rect.size.width/3-15, 30);
        button.tag = 10+i;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置副标题图片
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20,5, 20, 20)];
//                                   CGRectMake(button.frame.origin.x+10, button.frame.origin.y, 20, 20)];
        UIImage * image = [UIImage imageNamed:array1[i]];
        imageView.image = image;
        [button addSubview:imageView];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.alpha = 0.6;
        button.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:button];
    }
}

-(void)createMoreButtons
{
    NSArray * array = @[@"gerenzhuye.png",@"xinxianshi.png",@"haoyou.png",@"yingyong.png",@"weizhifuwu.png",@"xiangce.png",@"zhaoren.png",@"chat.png",@"zhanneixin.png"];
    NSArray * array1 =@[@"个人主页",@"新鲜事",@"好友",@"应用",@"位置",@"相册",@"搜索",@"聊天",@"站内信"];
    CGRect rect = [UIScreen mainScreen].bounds;
    for(int i =0;i<9;i++)
    {
        UIButton * button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(10+i%3*rect.size.width/3,100+i/3*150,rect.size.width/3-20, 100);
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 60, 60)];
        UIImage * image = [UIImage imageNamed:array[i]];
        imageView.image = image;
        [button addSubview:imageView];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(15, 70, 70, 30)];
        label.text = array1[i];
        label.textColor=[UIColor grayColor];
        [button addSubview:label];
        button.tag = 20+i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)button
{
    if (button.tag == 10||button.tag == 25) {
        MainPhotoViewController * mavc = [[MainPhotoViewController alloc]init];
        [self.navigationController pushViewController:mavc animated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self navigationBarStyleSetting];
}

//设置导航栏
-(void)navigationBarStyleSetting
{
    UINavigationBar * gationBar = self.navigationController.navigationBar;
    [gationBar setBackgroundImage:[UIImage imageNamed:@"header.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIImage * image = [UIImage imageNamed:@"logo_title"];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 35)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateHighlighted];
    [self.navigationItem setTitleView:button];
    
    UIImage * image1 = [UIImage imageNamed:@"main_left_nav"];
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.leftBarButtonItem = item1;
    
    UIImage * image2 = [UIImage imageNamed:@"main_right_nav"];
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithImage:image2 style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = item2;
}

-(void)leftItemClicked
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
