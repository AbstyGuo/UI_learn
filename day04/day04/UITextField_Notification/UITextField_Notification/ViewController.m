//
//  ViewController.m
//  UITextField_Notification
//
//  Created by 夏婷 on 15/11/19.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)dealloc
{
   //拿到通知中心
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //移除监听键盘将要出现的通知
    //第一个参数，要移除的监听对象
    //第二参数，移除监听的通知名字
    //第三个：传递的对象，在移除时，通常也是nil
    [nc removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    //移除监听键盘将要隐藏的通知
    [nc removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    //移除监听键盘frame将要改变的通知
    [nc removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //监听出现和隐藏，通过键盘高度做视图修改
    
    //获取通知中心,
    //系统提供的一个单例，
    NSNotificationCenter * nc =[NSNotificationCenter defaultCenter];
    //注册监听UIKeyboardWillShowNotification通知，键盘将要出现的通知
    //第一个参数：Observer,添加监听的对象
    //第二参数：接收到键盘将要出现这个通知之后，要调用的方法
    //第三个参数：通知的名字，
    //第四个参数：传递的对象，注册是通常都是nil, 具体发送通知是，携带的对象（信息）
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //注册监听键盘将要隐藏的通知
    [nc addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    //添加键盘frame将要改变的通知
    [nc addObserver:self selector:@selector(frameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    UITextField *textField2 = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 50)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField2];
    
  
    
}

//键盘frame发生改变时调用
-(void)frameChange:(NSNotification *)notify
{
    NSLog(@"键盘frame变化了");
}


-(void)keyboardWillHidden:(NSNotification *)notify
{
    NSDictionary *userInfo = notify.userInfo;
    //解析键盘收起动画执行时间
    CGFloat time = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    __unsafe_unretained  ViewController *VC = self;
    [UIView animateWithDuration:time animations:^{
        VC.view.bounds = CGRectMake(0, 0, VC.view.frame.size.width, VC.view.frame.size.height);
    }];
    
}
-(void)keyboardWillShow:(NSNotification *)notify
{
    //获取通知携带的信息
    NSDictionary *userInfo = notify.userInfo;
    NSLog(@"%@",userInfo);
    //解析键盘弹出动画执行时间
    CGFloat animationTime = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    __weak ViewController *viewController = self;
    [UIView animateWithDuration:animationTime animations:^{
        viewController.view.bounds = CGRectMake(0, 140, viewController.view.frame.size.width, viewController.view.frame.size.height);
    }];
    
    //解析键盘的大小
//    CGRect frame = [[userInfo objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
