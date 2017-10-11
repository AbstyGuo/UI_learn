//
//  UIActionSheetViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UIActionSheetViewController.h"

@interface UIActionSheetViewController ()<UIActionSheetDelegate>

@end

@implementation UIActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"分享" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonClicked
{
    //UIActionSheet  提示框，从屏幕底端弹出
    //
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"分享" delegate:self cancelButtonTitle:@"返回" destructiveButtonTitle:@"销毁" otherButtonTitles:@"微信朋友圈",@"QQ空间",@"新浪微博", nil];
    [sheet showInView:self.view];
}

//当点击UIActionSheet上的按钮时，调用这个方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //buttonIndex 不包括取消按钮
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"销毁按钮被点击");
        }
            break;
        case 1:
        {
            NSLog(@"微信朋友圈按钮被点击");
        }
            break;
        case 2:
        {
            NSLog(@"QQ空间按钮被点击");
        }
            break;
        case 3:
        {
            NSLog(@"新浪微博按钮被点击");
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
