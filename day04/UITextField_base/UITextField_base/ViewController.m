//
//  ViewController.m
//  UITextField_base
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
    // UITextField文本输入框，用于文本的一个空间，继承与UIControl，间接继承于UIview，是一个带协议的控件
    //创建并设置起始位置和大小
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, self.view.frame.size.width-100, 50)];
    //设置边框样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 10;
    //添加到当前视图控制器上
    [self.view addSubview:textField];
    
    //关于文本的设置
    [self textSetting];
    //关于样式的设置
    [self styleSetting];
    //关于键盘的设置
    [self keyBoardSetting];
}

#pragma mark-关于键盘的设置
-(void)keyBoardSetting
{
    UITextField * textField = (id)[self.view viewWithTag:10];
    //设置键盘外观
    textField.keyboardAppearance = UIKeyboardAppearanceDefault;
    //UIKeyboardAppearanceLight     默认的白色外观
    //UIKeyboardAppearanceDark      黑色外观
    //UIKeyboardAppearanceDefault   白色外观
    //UIKeyboardAppearanceAlert     黑色外观
    //设置键盘类型，开发者根据需求，选择合适的键盘
    textField.keyboardType = UIKeyboardTypeDefault;
    /*
     UIKeyboardTypeDefault,                     UIKeyboardTypeASCIICapable,                UIKeyboardTypeNumbersAndPunctuation,       UIKeyboardTypeURL,
     UIKeyboardTypeNumberPad,                   UIKeyboardTypePhonePad,
     UIKeyboardTypeNamePhonePad,
     UIKeyboardTypeEmailAddress,                UIKeyboardTypeDecimalPad
     UIKeyboardTypeTwitter 
     UIKeyboardTypeWebSearch
     UIKeyboardTypeAlphabet
     */
    //设置键盘return键类型
    textField.returnKeyType = UIReturnKeyEmergencyCall;
    /*
     UIReturnKeyDefault,
     UIReturnKeyGo,
     UIReturnKeyGoogle,
     UIReturnKeyJoin,
     UIReturnKeyNext,
     UIReturnKeyRoute,
     UIReturnKeySearch,
     UIReturnKeySend,
     UIReturnKeyYahoo,
     UIReturnKeyDone,
     UIReturnKeyEmergencyCall,
     */
    //自定义二级键盘  参数是继承于UIView的类的对象都可以设置为二级键盘
  //  textField setInputAccessoryView:<#(UIView *)#>
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    view.backgroundColor = [UIColor cyanColor];
    //设置二级键盘
    textField.inputAccessoryView = view;
    //设置主键盘 参数是继承于UIView的类的对象都可以设置为二级键盘
    //textField setInputView:<#(UIView *)#>
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 253)];
    imageView.backgroundColor = [UIColor magentaColor];
    textField.inputView = imageView;
}

#pragma mark-关于样式的设置
-(void)styleSetting
{
    //找到textField
    UITextField * textField=(id)[self.view viewWithTag:10];
    //设置边框
    textField.borderStyle = UITextBorderStyleNone;
    /*
     UITextBorderStyleNone,         无边框
     UITextBorderStyleLine,         线形边框
     UITextBorderStyleBezel,        尖角矩形
     UITextBorderStyleRoundedRect   圆角矩形
     */
    //设置背景颜色
    textField.backgroundColor = [UIColor cyanColor];
//    //设置圆角
//    textField.layer.cornerRadius = 25;
//    //设置边框线的颜色
//    textField.layer.borderColor = [UIColor blackColor].CGColor;
//    //设置边框线的宽度
//    textField.layer.borderWidth = 2;
    //设置背景图片，要求无边框,可编辑状态下的背景图片
    textField.background = [UIImage imageNamed:@"1.png"];
    //设置不可编辑状态下的背景图片
    textField.disabledBackground = [UIImage imageNamed:@"5.png"];
    //设置输入框是否可以编辑
//    textField.enabled = YES;
    textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    /*
     UITextFieldViewModeNever,          从不显示
     UITextFieldViewModeWhileEditing,   编辑时显示，文字也不为空
     UITextFieldViewModeUnlessEditing,  非编辑时显示，文字不为空的前提
     UITextFieldViewModeAlways          总是显示，text不为空
     */
    //创建图片
    UIImageView * leftView = [[UIImageView alloc]initWithFrame:CGRectMake(00, 0, 50, 50)];
    leftView.image = [UIImage imageNamed:@"player_down_1.png"];
    //设置左视图
    [textField setLeftView:leftView];
   // textField.leftView = leftView;
    //设置左视图的显示模式
    textField.leftViewMode = UITextFieldViewModeAlways;
    //左视图和左视图的显示模式必须一起设置，默认的显示模式是从不显示
    
    //设置右视图，会遮挡清除按钮
    UIView * rigthView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    rigthView.backgroundColor = [UIColor purpleColor];
    //设置右视图，但是默认的显示模式是从不显示
    textField.rightView = rigthView;
    //设置右视图的显示模式
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}


#pragma mark-关于文本的设置
-(void)textSetting
{
    UITextField * textField=(id)[self.view viewWithTag:10];
    //设置初始文字
    //textField.text = @"我是文本输入框";
    //设置初始文字颜色
    textField.textColor = [UIColor blueColor];
    //设置字体
    textField.font = [UIFont boldSystemFontOfSize:20];
    //设置对其方式
    textField.textAlignment = NSTextAlignmentCenter;
    //设置提示文字
    textField.placeholder = @"请输入信息";
    //设置密文输入
    //textField.secureTextEntry = YES;
    //成为第一响应者
    //第一响应者就是当前界面下，正在编辑的或正在操作的可编辑、可输入控件（UITextField  UITextView）
    [textField becomeFirstResponder];
    //当开始编辑时，清空现有文字
    textField.clearsOnBeginEditing = YES;
    //设置大小写控制
    textField.autocapitalizationType =UITextAutocapitalizationTypeAllCharacters;
    /*
     UITextAutocapitalizationTypeNone           无
     UITextAutocapitalizationTypeWords,         每个单词的第一个字符大写
     UITextAutocapitalizationTypeSentences,     每一个句子的第一个字符大写
     UITextAutocapitalizationTypeAllCharacters, 所有的字符都大写
     */
}

//触摸开始，是UIResponder中的方法，UIViewController继承于UIResponder，可以重写下面这个方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field = [self.view viewWithTag:10];
    //放弃第一响应
    [field resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
