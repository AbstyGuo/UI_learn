//
//  ViewController.m
//  homeWork_keyBoard
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(50, 130, self.view.frame.size.width-100, 50)];
    field.borderStyle = UITextBorderStyleNone;
    field.tag = 10;
    field.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:field];
    [self textSetting];
    [self keyBoardSetting];
    [self mainBoardSetting];
}

-(void)mainBoardSetting
{
    UITextField * textField=(id)[self.view viewWithTag:10];
    NSArray *titleArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@".",@"+",@"-",@"x",@"=",@"⬅"];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 258)];
    view.tag = 30;
    [textField setInputView:view];
    int i = 0;
    for (NSString * title in titleArray)
    {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(10+(i % 4) * 90,20+55 * (i/4), 85, 50);
        button.tag = 100+i;
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(mainbuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        i++;
        [view addSubview:button];
    }

}

-(void)mainbuttonClicked:(UIButton *)sender
{
       UITextField * textField=(id)[self.view viewWithTag:10];
    if (sender.tag!=115) {
         textField.text = [NSString stringWithFormat:@"%@%@",textField.text,sender.titleLabel.text.length >0 ? sender.titleLabel.text:@""];
    }else
    {
        if([textField.text length]>0)
        {NSMutableString * str = [textField.text substringToIndex:[textField.text length]-1];
        textField.text = str;
        }
    }
    
    
}

-(void)keyBoardSetting
{
    UITextField * textField=(id)[self.view viewWithTag:10];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    view.backgroundColor = [UIColor cyanColor];
    view.tag = 20;
    textField.inputAccessoryView = view;
    NSArray * arr =@[@"😉",@"😍",@"🐨",@"🐻",@"🔥",@"💩",@"💘",@"👿",@"👽",@"🎋"];
    for (int i=0; i<10; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(5+i*33, 5, 30, 30)];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)sender
{
    UITextField * textField=(id)[self.view viewWithTag:10];
    NSArray * arr =@[@"😉",@"😍",@"🐨",@"🐻",@"🔥",@"💩",@"💘",@"👿",@"👽",@"🎋"];
    NSInteger x = sender.tag;
    int i = (int)x-100;
    NSMutableString * str = [NSMutableString stringWithString:textField.text];
    [str appendString:arr[i]];
    textField.text=str;
}

-(void)textSetting
{
    UITextField * textField=(id)[self.view viewWithTag:10];
    textField.textColor = [UIColor blueColor];
    textField.font = [UIFont boldSystemFontOfSize:20];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = @"请输入信息";
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field = (id)[self.view viewWithTag:10];
    //放弃第一响应
    [field resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
