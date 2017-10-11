//
//  ViewController4.m
//  HomeWork_8
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4
-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"colorChanged" object:nil];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //注册监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(colorChanged:) name:@"colorChanged" object:nil];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"加载4");
   
    
    
}
-(void)colorChanged:(NSNotification *)notify
{
    self.view.backgroundColor = notify.object;
    NSLog(@"界面4收通知");
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
