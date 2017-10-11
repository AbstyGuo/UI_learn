//
//  UITextViewViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UITextViewViewController.h"

@interface UITextViewViewController ()<UITextViewDelegate>

@end

@implementation UITextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)createControl
{
    //UITextView 继承于UIScrollView（滚动视图）UITextView是一个可以滚动的文本输入视图，可以转行
    UITextView *  textView = [[UITextView alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 200)];
    textView.tag = 50;
    
    //关于文字的设置
    textView.text = @"我是UITextView";//文字
    textView.textColor = [UIColor redColor];//文字颜色
    textView.font = [UIFont boldSystemFontOfSize:30];//字体大小
    textView.textAlignment = NSTextAlignmentRight;//对齐方式
    textView.autocapitalizationType = UITextAutocapitalizationTypeSentences;//关于大小写规则
    //键盘
    textView.keyboardAppearance = UIKeyboardAppearanceDark;//设置键盘外观
    textView.keyboardType = UIKeyboardTypeURL;//设置键盘类型
//    //自定义主键盘
//    UIView * inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 258)];
//    inputView.backgroundColor = [UIColor magentaColor];
//    textView.inputView = inputView;//修改主键盘
//    
//    //自定义二级键盘
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 50)];
//    view.backgroundColor = [UIColor cyanColor];
//    textView.inputAccessoryView = view;//修改二级键盘
    
    //设置是否可以滚动
    textView.scrollEnabled = YES;//YES允许滚动，NO不允许滚动
    
    //关于代理
    //设置代理
    textView.delegate = self;
    [self.view addSubview:textView];
}

#pragma mark - 遵循协议方法
//将要开始编辑时调用这个方法，返回YES允许开始编辑，返回NO不允许编辑
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

//已经开始编辑，调用这个方法，只能上个方法返回YES才会执行
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
}

//文字发生改变时调用这个方法
-(void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"%@",textView.text);
}

//将要把新输入的文字拼接到原有的text末尾时调用的方法，返回YES允许拼接，返回NO不允许拼接
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
}

//即将结束编辑时调用这个方法,返回YES允许结束，返回NO不允许结束
-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

//选中文字发生改变时调用的方法
-(void)textViewDidChangeSelection:(UITextView *)textView
{
    //textView.selectedRange
    NSString * selectedStr = [textView.text substringWithRange:textView.selectedRange];
    NSLog(@"%@",selectedStr);
}

//将要改变选中范围时调用的方法。返回YES，允许选中，NO不允许
-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextView * textView = (id)[self.view viewWithTag:50];
    [textView resignFirstResponder];//放弃第一响应
    //[self setEditing:NO];//设置NO，放弃全屏的所有编辑
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
