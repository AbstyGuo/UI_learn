//
//  ViewController.m
//  day08_homeWork
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>

@end

@implementation ViewController
-(void)buttonClicked{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"返回到" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"首页" otherButtonTitles:@"上一页", nil];
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //buttonIndex不包括取消按钮
    NSArray *array = self.navigationController.viewControllers;
    switch (buttonIndex) {
        case 0:
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
    
        case 1:
        {
            [self.navigationController popToViewController:array[_count-1] animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)buttonClicked1{
    
    ViewController *vc = [[ViewController alloc]init];
    vc.count = _count+1;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClicked)];
    self.navigationItem.leftBarButtonItem = item1;
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClicked1)];
    self.navigationItem.rightBarButtonItem = item2;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_count) {
        self.navigationItem.title = [NSString stringWithFormat:@"第%d页",_count+1];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
