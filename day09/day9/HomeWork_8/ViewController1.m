//
//  ViewController1.m
//  HomeWork_8
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

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
    NSLog(@"加载1");
    //注册监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(colorChanged:) name:@"colorChanged" object:nil];
    

}
-(void)colorChanged:(NSNotification *)notify
{
    self.view.backgroundColor = notify.object;
    NSLog(@"界面1收通知");
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
