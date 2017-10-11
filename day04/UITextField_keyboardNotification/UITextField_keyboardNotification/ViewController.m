//
//  ViewController.m
//  UITextField_keyboardNotification
//
//  Created by MS on 15-11-19.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //监听键盘的出现和隐藏，通过键盘的高度做一些视图修改
    
    //获取通知中心  是系统提供的一个单例，
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    //注册监听键盘将要出现的消息通知
    //第一个参数addObserver：添加监听的对象，谁现在要监听
    //第二个参数selector：监听到消息之后调用的方法
    //第三个参数name：通知的名字
    //第四个参数object：传递的对象，注册时通常都是nil，具体发送通知时携带的对象或信息
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //注册监听键盘将要隐藏的通知
    [nc addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width-100, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 10;
    
    //添加键盘frame将要改变的通知
    [nc addObserver:self selector:@selector(frameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self.view addSubview:textField];
    
    UITextField * textField2 = [[UITextField alloc]initWithFrame:CGRectMake(50, 400, self.view.frame.size.width-100, 50)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField2];
    textField2.tag =20;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field1 = (id)[self.view viewWithTag:10];
    UITextField * field2 = (id)[self.view viewWithTag:20];
    [field1 resignFirstResponder];
    [field2 resignFirstResponder];
}

//键盘frame发生改变时执行的方法
-(void)frameChange:(NSNotification *)notify
{
    NSLog(@"键盘frame变化了");
}

-(void)dealloc
{
    //拿到通知中心，告诉通知中心移除
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    //移除监听键盘将要出现的通知
    //第一个参数，要移除的监听对象
    //第二个参数，移除监听通知的名字
    //第三个：传递的对象，移除的时候通常是nil
    [nc removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    //移除键盘将要隐藏的监听
    [nc removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    //移除键盘frame变化的监听
    [nc removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

//键盘将要隐藏时调用
-(void)keyboardWillHidden:(NSNotification *)notify
{
    NSDictionary * userInfo = notify.userInfo;
    //解析键盘收起动画执行时间
    CGFloat time =[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    __unsafe_unretained ViewController *VC=self;
    [UIView animateWithDuration:time animations:^{
        VC.view.bounds = CGRectMake(0, 0, VC.view.frame.size.width, VC.view.frame.size.height);
    }];
}

-(void)keyboardWillShow:(NSNotification *)notify
{
    //获取通知携带的信息
    NSDictionary * userInfo = notify.userInfo;
    //解析键盘弹出动画执行时间
    CGFloat animationTime = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    __weak ViewController * viewController = self;
    [UIView animateWithDuration:animationTime animations:^{
        viewController.view.bounds = CGRectMake(0, 140, viewController.view.frame.size.width, viewController.view.frame.size.height);
    }];
    //解析键盘大小
   // CGRect frame = [[userInfo objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
