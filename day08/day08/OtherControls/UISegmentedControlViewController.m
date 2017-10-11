//
//  UISegmentedControlViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@end

@implementation UISegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark -创建相应的控件
-(void)createControl
{
    UIImage *image = [[UIImage imageNamed:@"chat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; ;
    NSArray *items = @[@"第一段",image,@"第三段"];
    //创建段控制器
    UISegmentedControl *sc = [[UISegmentedControl alloc]initWithItems:items];
    //设置frame
    sc.frame = CGRectMake(50, 100, self.view.frame.size.width - 100, 50);
    //设置当前选中段
    sc.selectedSegmentIndex = 1;
    //设置背景颜色
    sc.backgroundColor = [UIColor grayColor];
    //设置镂空部分的颜色
    sc.tintColor = [UIColor magentaColor];
    //设置某一段的标题
    [sc setTitle:@"段段" forSegmentAtIndex:0];
    //获取某一段的标题
    NSString *title2 = [sc titleForSegmentAtIndex:2];
    NSLog(@"%@",title2);
    //拿到某一段的图片,没有图片返回nil
    UIImage *image2 = [sc imageForSegmentAtIndex:1];
    //设置某一段的图片
    [sc setImage:image2 forSegmentAtIndex:2];
    
    //设置背景图片
    [sc setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //新添加一段
    [sc insertSegmentWithTitle:@"新段段" atIndex:2 animated:NO];
    //移除一段
    [sc removeSegmentAtIndex:3 animated:NO];
    
    //添加事件
    //Target：调用方法的对象
    //action:调用的方法名
    //Events:触发时机
    [sc addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //添加到当前视图上
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
