//
//  RegisterViewController.m
//  day04_homeWork
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createLabels];
    [self createFields];
    [self createButtons];
}

-(void)createButtons
{
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(120, 270, 60, 30)];
    UIButton * button2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-130, 270, 60, 30)];
    [button1 setTitle:@"注册" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.tag = 60;
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"返回" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.tag = 70;
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
}

-(void)buttonClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createFields
{
    UITextField * field1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, self.view.frame.size.width-170, 30)];
    field1.tag = 35;
    field1.delegate = self;
    field1.returnKeyType = UIReturnKeyNext;
    UITextField * field2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, self.view.frame.size.width-170, 30)];
     field2.tag = 36;
    field2.delegate = self;
    field2.returnKeyType = UIReturnKeyNext;
    UITextField * field3 = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, self.view.frame.size.width-170, 30)];
     field3.tag = 37;
    field3.delegate = self;
    field3.returnKeyType = UIReturnKeyDone;
    field1.borderStyle = UITextBorderStyleRoundedRect;
    field2.borderStyle = UITextBorderStyleRoundedRect;
    field3.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:field1];
    [self.view addSubview:field2];
    [self.view addSubview:field3];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field1 = (id)[self.view viewWithTag:35];
    UITextField * field2 = (id)[self.view viewWithTag:36];
    UITextField * field3 = (id)[self.view viewWithTag:37];
    [field1 resignFirstResponder];
    [field2 resignFirstResponder];
    [field3 resignFirstResponder];
}

//return被点击后调用的方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag ==35) {
        UITextField * textField2 = (id)[self.view viewWithTag:36];
        [textField2 becomeFirstResponder];
    }else if (textField.tag ==36) {
        UITextField * textField2 = (id)[self.view viewWithTag:37];
        [textField2 becomeFirstResponder];
    }else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    return YES;//YES表示有效，NO表示无效
}


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
    
    UILabel * label3 =[[UILabel alloc]initWithFrame:CGRectMake(50, 200, 60, 30)];
    label3.text = @"邮箱";
    //label2.backgroundColor =[UIColor redColor];
    label3.font = [UIFont boldSystemFontOfSize:17];
    label3.textColor = [UIColor blackColor];
    [self.view addSubview:label3];
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
