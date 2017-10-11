//
//  PageControlViewController.m
//  day08_homeWork
//
//  Created by MS on 15-12-3.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "PageControlViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
@interface PageControlViewController ()<UITabBarControllerDelegate>

@end

@implementation PageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self createTabBarController];
}
-(void)createTabBarController{
    ViewController1 *vc1 = [[ViewController1 alloc]init];
    vc1.title = @"首页";
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc1];
    ViewController2 *vc2 = [[ViewController2 alloc]init];
    vc2.title = @"添加";
    ViewController3 *vc3 = [[ViewController3 alloc]init];
    vc3.title = @"联系人";
    ViewController4 *vc4 = [[ViewController4 alloc]init];
    vc4.title = @"动态";
    ViewController5 *vc5 = [[ViewController5 alloc]init];
    vc5.title = @"设置";
    NSArray *viewControllers = @[nvc,vc2,vc3,vc4,vc5];

    self.viewControllers = viewControllers;
    
//    PageControlViewController *pvc = [[PageControlViewController alloc]init];
    
    
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
