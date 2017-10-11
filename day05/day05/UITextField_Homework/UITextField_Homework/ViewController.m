//
//  ViewController.m
//  UITextField_Homework
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "MyTextField.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MyTextField *textField = [[MyTextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
