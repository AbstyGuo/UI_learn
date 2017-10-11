//
//  RootViewController.m
//  day08_homeWork
//
//  Created by MS on 15-12-3.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "RootViewController.h"
#import "PageControlViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createButton];
}
-(void)createButton{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 120, 50, 30)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"账号";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 180, 50, 30)];
    label2.backgroundColor = [UIColor lightGrayColor];
    label2.text = @"密码";
    label2.textColor = [UIColor blackColor];
    [self.view addSubview:label2];
    
    
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(120, 120, 200, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.tintColor = [UIColor blackColor];
    textField.tag = 10;
    [self.view addSubview:textField];
    
    UITextField *textField2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 180, 200, 30)];
    textField2.backgroundColor = [UIColor whiteColor];
    textField2.tintColor = [UIColor blackColor];
    textField2.tag = 20;
    [self.view addSubview:textField2];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(250, 320, 40, 30)];
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor yellowColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void)buttonClicked{
    PageControlViewController *pvc = [[PageControlViewController alloc]init];
   
    [self presentViewController:pvc animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *red = [[NSUserDefaults standardUserDefaults]objectForKey:@"red"];
    NSString *green = [[NSUserDefaults standardUserDefaults]objectForKey:@"green"];
    NSString *blue = [[NSUserDefaults standardUserDefaults]objectForKey:@"blue"];
    float r = [red floatValue];
    float g = [green floatValue];
    float b = [blue floatValue];
    self.view.backgroundColor = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
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
