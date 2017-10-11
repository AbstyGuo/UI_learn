//
//  RootViewController.m
//  BlockDemo
//
//  Created by 夏婷 on 15/8/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1.block的声明
  
    //声明一个名字为blockName的block变量
    //-(void)funcName:(BOOL)value

    void(^blockName)(BOOL value,NSString *str);
    //2.给block赋值
    blockName = ^(BOOL va1,NSString * str1){
        NSLog(@"%d,%@",va1,str1);
    };
    
    blockName(YES,@"调用block");
    //声明一个带返回值的block，并给它赋值
    
    __unsafe_unretained RootViewController *rvc = self;
    NSString *(^block2)(UIColor * color) =^(UIColor * colorValue){
        
        rvc.view.backgroundColor = colorValue;
        return @"用来返回的字符串";
        
    };
    
  NSString *str = block2([UIColor greenColor]);
    NSLog(@"block返回的字符串====%@",str);
    
   //3:block作为参数
    
    void(^useBlock)(BOOL value) = ^(BOOL value)
    {
        if (value == YES) {
            
            NSLog(@"作为参数的block");
        }
    };
    
    [self useAblock:useBlock];
    /*
    [self useAblock:^(BOOL value) {
        if (value == YES) {
            
            NSLog(@"作为参数的block");
        }
    }];
     */
    
    void(^returnAblock)(BOOL value) = [self returnAblock];
    if (returnAblock) {
        
        returnAblock(YES);
    }
    
    
}
-(void)useAblock:(void(^)(BOOL value))block
{
    if (block) {
        NSLog(@"用block了");
        block(YES);
    }
}
//作为返回值
-(void(^)(BOOL value))returnAblock
{
    return ^(BOOL value){
        
        NSLog(@"作为返回值的block");
    };
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self funcName:YES];
}
//函数的实现部分，不调用是不会执行函数中得代码的，调用才执行
-(void)funcName:(BOOL)value
{
    NSLog(@"调用函数");
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
