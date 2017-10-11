//
//  UISegmentedControlViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@end

@implementation UISegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建相应的控件
-(void)createControl
{
    UIImage * image = [[UIImage imageNamed:@"chat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSArray * items = @[@"第一段",image,@"第三段"];
    //创建段控制器
    UISegmentedControl * sc = [[UISegmentedControl alloc]initWithItems:items];
    //设置frame
    sc.frame = CGRectMake(0, 64, self.view.frame.size.width,44);
    //设置当前选中段
    sc.selectedSegmentIndex = 1;
//    sc.backgroundColor = [UIColor whiteColor];//背景颜色
    sc.tintColor = [UIColor colorWithRed:255/255.f green:155/255.f blue:0 alpha:1];//镂空部分颜色
    [sc setTitle:@"美食" forSegmentAtIndex:0];//设置某一段标题
    NSString * title2 = [sc titleForSegmentAtIndex:2];//拿到指定段的标题
    //拿到某一段的图片，没有图片返回nil
    UIImage * image1 = [sc imageForSegmentAtIndex:1];
    [sc setImage:image1 forSegmentAtIndex:2];
    //设置背景图片
    [sc setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //添加或删除一段
    [sc insertSegmentWithTitle:@"娱乐" atIndex:2 animated:NO];
    [sc insertSegmentWithTitle:@"社区" atIndex:4 animated:NO];
    [sc removeSegmentAtIndex:3 animated:NO];
    //值发生改变时添加点击事件
    //调用方法的对象   调用方法   调用方法触发机制
    [sc addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sc];
}

//选中某一段时调用的方法
-(void)valueChanged:(UISegmentedControl *)sc
{
    switch (sc.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"选中第一段");
        }
            break;
        case 1:
        {
            NSLog(@"选中第二段");
        }
            break;

        case 2:
        {
            NSLog(@"选中第三段");
        }
            break;
        case 3:
        {
            NSLog(@"选中第四段");
        }
            break;
        default:
            break;
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
