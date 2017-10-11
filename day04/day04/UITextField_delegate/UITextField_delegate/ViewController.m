//
//  ViewController.m
//  UITextField_delegate
//
//  Created by 夏婷 on 15/11/19.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>//遵循UITextFieldDelegate协议

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 50)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 10;
    //指定代理，对textField进行操作时，textField委托self执行相应的协议方法
    textField.delegate = self;
    //设置清除按钮的显示模式
    textField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:textField];
    
    
    UITextField * textField2 = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 50)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.tag = 20;
    //指定代理
    textField2.delegate = self;
    [self.view addSubview:textField2];
    
}

#pragma mark -  UITextFieldDelegate Methods 

//textField将要开始编辑时，调用这个方法
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
   [UIView animateWithDuration:0.25 animations:^{
       
       self.view.bounds = CGRectMake(0, 130, self.view.bounds.size.width, self.view.bounds.size.height);
   }];
    if(textField.tag == 10)
    {
        NSLog(@"将要开始编辑");
        return YES;
    }else
        return YES;
    //返回YES允许编辑，NO不允许
}
//textField已经开始编辑之后，调用这个协议方法，调这个方法的前提是允许开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"已经开始编辑");
}
//将要结束编辑时，调用这个协议方法
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"将要结束编辑");
    return YES;
    //返回YES，允许结束编辑，NO不允许
}
//已经结束编辑时调用这个协议方法，可以作为一次输入结束的标志，可以存储输入的文本、也可以传递输入的文本
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"已经结束编辑");
    if (textField.tag == 20) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        }];
    }
}
//return按钮被点击时，调用的协议方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 10) {
        UITextField *textField2 = (id)[self.view viewWithTag:20];
        [textField2 becomeFirstResponder];
    }else
    {
        [textField resignFirstResponder];
    }
    return YES;
}
//点击清除按钮之后，清除text之前调用的协议方法
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    return NO;//返回YES，允许清除text,返回NO不允许清除
}
//输入新的字符串时，将要拼接到已有的text的后面之前调用这个协议方法，返回YES，允许拼接，返回NO不允许
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //~!@#$%^&*()
    if ([string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"~!@#$%^&*()"]].count > 1) {//不允许输入特殊字符
        return NO;
    }
    //允许拼接到text之后，形成新的text
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
