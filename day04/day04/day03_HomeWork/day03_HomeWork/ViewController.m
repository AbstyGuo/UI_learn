//
//  ViewController.m
//  day03_HomeWork
//
//  Created by 夏婷 on 15/11/19.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createButtons];
}
-(void)createButtons
{
    for (int i = 0; i < 9; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(40 + (i % 3) * 100, 150 + (i / 3) * 100, 100, 100);
        NSString *imageName = [NSString stringWithFormat:@"2_%d.jpg",i + 5];
        //设置普通状态的背景图片
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        //设置高亮状态的背景图片
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

-(void)buttonClicked:(UIButton *)button
{
    [self.view bringSubviewToFront:button];
    
    static CGRect frame;
    if (button.frame.size.width != self.view.frame.size.width)
    {
        frame = button.frame;
        [UIView animateWithDuration:1 animations:^{
            
            button.frame = self.view.bounds;
        }];
    }else
    {
        //放回原位置
        [UIView animateWithDuration:1 animations:^
        {
            button.frame = frame;
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
