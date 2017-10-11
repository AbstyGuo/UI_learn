//
//  UIAlertViewViewController.m
//  OtherControls
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 guoyongfeng. All rights reserved.
//

#import "UIAlertViewViewController.h"

@interface UIAlertViewViewController ()<UIAlertViewDelegate,UITextFieldDelegate>//遵循提示框的协议
{
    UIAlertController * alertVC;//成员变量
}
@end

@implementation UIAlertViewViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];//移除通知
    UITextField * textField = alertVC.textFields[0];
    [textField removeObserver:self forKeyPath:@"text"];//移除注释的添加的观察者
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(50, 100, 50, 50);
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonClicked
{
#if 1
    //UIAlertView  是提示框、警告框视图
    //iOS8(包含)以前可以用，iOS9之后用UIAlertController代替
    //Title:提示的简单描述
    //message:提示的具体信息
    //delegate:代理
    //cancelButtonTitle:取消按钮的标题
    //otherButtonTitles:其他按钮的标题，写几个标题，就会有几个按钮
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"就这样了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"等等",nil];
    alertView.alertViewStyle =UIAlertViewStyleLoginAndPasswordInput;
    /*
     UIAlertViewStyleDefault = 0,           默认，什么都不带
     UIAlertViewStyleSecureTextInput,       带一个密文输入框的提示框样式
     UIAlertViewStylePlainTextInput,        带一个明文输入框的提示框
     UIAlertViewStyleLoginAndPasswordInput  带一个明文和一个密文 两个输入框
     */
    //显示到窗口上
    [alertView show];
#else
    //iOS9以后的用法
    //提示框控制器，有alertView模式和actionSheet模式，注意一点就是actionSheet时，不能添加textField
    //Title:提示的简要信息
    //message:提示的具体信息
    //preferredStyle:有   UIAlertControllerStyleActionSheet = 0,
    //               和   UIAlertControllerStyleAlert   两种模式
    if(alertVC)
    {
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    
    alertVC = [UIAlertController alertControllerWithTitle:@"就这些" message:@"凑合看吧" preferredStyle:UIAlertControllerStyleAlert];
    
    //添加取消按钮
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
        NSLog(@"取消的操作");
    }];
    /*
     UIAlertActionStyleDefault = 0,   默认
     UIAlertActionStyleCancel,        取消
     UIAlertActionStyleDestructive    销毁
     */
    [alertVC addAction:cancelAction];
    
    //创建默认样式的按钮
    UIAlertAction * deAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        NSLog(@"确定的操作");
        
    }];
    [alertVC addAction:deAction];
    
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * textField){
        textField.placeholder = @"用户名";
    }];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * textField){
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
//    UITextField * textField = alertVC.textFields[0];
//    //添加一个观察者self  监听text的文字变化，调用text set方法且text有变化才会调用观察者回调方法     forKeyPath:所要监听的属性   options:触发的时机
//    [textField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
//    textField.delegate = self;
    deAction.enabled = NO;
    
    //添加一个通知，监听textField的文字变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
    //将提示框控制器显示出来
    [self presentViewController:alertVC animated:YES completion:nil];
    
#endif
}

#pragma mark - 通知的回调方法
-(void)textChanged:(NSNotification *)notify
{
    UITextField * textField = notify.object;
    UIAlertAction * sureA = alertVC.actions[1];
    if (textField.text.length) {
        sureA.enabled = YES;
    }else
    {
        sureA.enabled = NO;
    }
}

//#pragma mark - 观察者的回调方法
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    //keyPath：观察的属性
//    //object对应添加观察者的对象
//    //change（字典类型）：改变的信息，
//    //context：描述
//    if ([keyPath isEqualToString:@"text"]) {
//        UITextField * textField = object;
//        if (textField.text.length) {
//            //拿到alertVC的所有UIAlertAction
//            NSArray * actionArray = alertVC.actions;
//            UIAlertAction * sureA = actionArray[1];
//            sureA.enabled = YES;//设置确定按钮可以点击
//        }else
//        {
//            //拿到alertVC的所有UIAlertAction
//            NSArray * actionArray = alertVC.actions;
//            UIAlertAction * sureA = actionArray[1];
//            sureA.enabled = NO;//设置确定按钮可以点击
//        }
//    }
//}

//返回输入框下第一个按钮是否可以点击，返回yes可以，返回no不可以
-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    UITextField * textField = [alertView textFieldAtIndex:0];
    UITextField * textField1 = [alertView textFieldAtIndex:1];
    if(textField.text.length&&textField1.text.length)
        return YES;//用户名密码都存在，允许点击
    else
        return NO;
}

//当点击提示框上某一个按钮时调用这个方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //从0开始对应按钮的顺序是从取消按钮依次对应提示框上的按钮
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"取消按钮被点击");
        }
             break;
        case 1:
        {
            NSLog(@"确定按钮被点击");
            //拿到第一个输入框
            UITextField * textField = [alertView textFieldAtIndex:0];
            UITextField * textField1 = [alertView textFieldAtIndex:1];
            //用用户名和密码提交给服务端
            NSLog(@"用户名：%@  密码：%@",textField.text,textField1.text);
        }
             break;
        case 2:
        {
            NSLog(@"等等按钮被点击");
        }
            break;
            
        default:
            break;
    }
    
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
