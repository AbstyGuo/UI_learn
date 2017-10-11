//
//  RootViewController.m
//  day03_HomeWork
//
//  Created by MS on 15-11-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    BOOL _isBig;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButtons];
}

-(void)createButtons
{
    static int m=1;
    _isBig=NO;
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(40+j*90, 100+i*110, 80, 100)];
            button.tag = 10+m;
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"2_%d.jpg",m++]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
    
}

-(void)buttonClicked:(UIButton *)button
{
    NSInteger x = button.tag-10;
    [self.view bringSubviewToFront:button];
    int i=(x-1)%3;
    int j=(int)(x-1)/3;
    if (_isBig==YES) {
        [UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
            button.frame = CGRectMake(40+i*90, 100+j*110, 80, 100);
        }completion:^(BOOL finished){
            
        }];
        _isBig = NO;
    }
    else if (_isBig==NO) {
//        __weak RootViewController * rvc = self;
        
        [UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
            button.frame = self.view.bounds;
        }completion:^(BOOL finished){
        }];
        _isBig = YES;

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
