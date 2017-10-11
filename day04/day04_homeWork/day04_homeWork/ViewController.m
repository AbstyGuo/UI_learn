//
//  ViewController.m
//  day04_homeWork
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "PageViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self createLabels];
    [self createFields];
    [self createButtons];
    

}

#pragma mark - button
-(void)createButtons
{
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(120, 210, 60, 30)];
    UIButton * button2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-130, 210, 60, 30)];
    [button1 setTitle:@"注册" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.tag = 30;
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"登陆" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.tag = 40;
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
}

-(void)buttonClicked:(UIButton *)button
{
    if (button.tag==30)
    {
        RegisterViewController * rvc = [[RegisterViewController alloc]init];
        rvc.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:rvc animated:YES completion:^{
        }];
    }else if (button.tag==40)
    {
        PageViewController * pvc =[[PageViewController alloc]init];
        pvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:pvc animated:YES completion:nil];
    }
}

#pragma mark - field
-(void)createFields
{
    UITextField * field1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, self.view.frame.size.width-170, 30)];
    field1.tag = 10;
    field1.returnKeyType = UIReturnKeyNext;
    field1.delegate =self;
    UITextField * field2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, self.view.frame.size.width-170, 30)];
    field2.tag = 20;
    field2.delegate = self;
    field2.returnKeyType = UIReturnKeyDone;
    field1.borderStyle = UITextBorderStyleRoundedRect;
    field2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:field1];
    [self.view addSubview:field2];
}

//return被点击后调用的方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag ==10) {
        UITextField * textField2 = (id)[self.view viewWithTag:20];
        [textField2 becomeFirstResponder];
    }else
    {
        PageViewController * pvc =[[PageViewController alloc]init];
        pvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:pvc animated:YES completion:nil];
    }
    return YES;//YES表示有效，NO表示无效
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field1 = (id)[self.view viewWithTag:10];
    UITextField * field2 = (id)[self.view viewWithTag:20];
    [field1 resignFirstResponder];
    [field2 resignFirstResponder];
}

#pragma mark - label
-(void)createLabels
{
    UILabel * label1 =[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 60, 30)];
    label1.text = @"用户名";
    //label1.backgroundColor =[UIColor redColor];
    label1.font = [UIFont boldSystemFontOfSize:17];
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    UILabel * label2 =[[UILabel alloc]initWithFrame:CGRectMake(50, 150, 60, 30)];
    label2.text = @"密码";
    //label2.backgroundColor =[UIColor redColor];
    label2.font = [UIFont boldSystemFontOfSize:17];
    label2.textColor = [UIColor blackColor];
    [self.view addSubview:label2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
