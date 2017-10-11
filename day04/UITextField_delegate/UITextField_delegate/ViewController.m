//
//  ViewController.m
//  UITextField_delegate
//
//  Created by 郭永峰 on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>//遵循文本输入框的协议

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width-100, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 10;
    //设置清除按钮的显示模式，总是显示
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.delegate = self;//指定代理，对TextField进行操作时，TextField委托self执行响应的协议方法，self指rvc,也就是controller的对象
    [self.view addSubview:textField];
    UITextField * textField2 = [[UITextField alloc]initWithFrame:CGRectMake(50, 260, self.view.frame.size.width-100, 50)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.tag = 20;
    textField2.delegate = self;//指定代理，对TextField进行操作时，TextField委托self执行响应的协议方法，self指rvc,也就是controller的对象
    [self.view addSubview:textField2];
}

#pragma mark - UITextFieldDelegate的方法
//textField将要开始编辑时调用这个方法
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.bounds = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
    if(textField.tag==10){
         NSLog(@"将要开始编辑");
        return YES;
    }else
    {
    return YES;//YES允许开始编辑，NO不允许
    }
}
//textField已经开始编辑之后，调用这个协议方法，调这个方法的前提是允许开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"已经开始编辑");
}
//将要结束编辑时调用这个协议方法
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"将要结束编辑");
    return YES;//返回YES允许结束编辑，NO不允许结束编辑
}
//允许结束编辑后，结束编辑调用的协议方法,作为一次输入结束的标志，可以存储输入的文本、也可以传递输入的文本
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==20) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        }];

    }
    NSLog(@"已经结束编辑");
    
}
//return按钮被点击时调用的协议方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag ==10) {
        UITextField * textField2 = (id)[self.view viewWithTag:20];
        [textField2 becomeFirstResponder];
    }else
    [textField resignFirstResponder];
    return YES;//YES表示有效，NO表示无效
}

//点击clear按钮之后，清除text之前调用的协议方法
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;//返回YES允许清除text的文字，返回NO不允许清除
}
//输入新的字符串时，将要拼接到已有的text的后面之前调用的协议方法，返回YES允许拼接，返回NO不允许
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //~!@#$%^&*()+
    if ([string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"~!@#$%^&*()+"]].count>1)
    {
        return NO;
    }
    //YES允许拼接到text之后，形成新的text
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
