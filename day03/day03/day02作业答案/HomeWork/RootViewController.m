//
//  RootViewController.m
//  HomeWork
//
//  Created by 夏婷 on 15/9/15.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGSize size = [UIScreen mainScreen].bounds.size;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, size.width - 20, 50)];
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.adjustsFontSizeToFitWidth = YES;
    label.tag = 10;
    label.text =@"";
    [self.view addSubview:label];
    
    [self createButtons];
}

-(void)createButtons
{
    NSArray *titleArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@".",@"+",@"-",@"x",@"="];
    int i = 0;
    for (NSString * title in titleArray)
    {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(50 + (i % 3) * 90, 150 + 55 * (i/3), 85, 50);
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        i++;
        [self.view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)button
{
    UILabel *label = (id)[self.view viewWithTag:10];
    label.text = [NSString stringWithFormat:@"%@%@",label.text,button.titleLabel.text.length >0 ? button.titleLabel.text:@""];
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
