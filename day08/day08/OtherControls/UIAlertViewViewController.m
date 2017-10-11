//
//  UIAlertViewViewController.m
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIAlertViewViewController.h"

@interface UIAlertViewViewController ()<UIAlertViewDelegate,UITextFieldDelegate>//遵循提示框的协议
{
    UIAlertController *alertVC;//成员变量
}

@end

@implementation UIAlertViewViewController


-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    UITextField *textField = alertVC.textFields[0];
    //移除textField所添加的观察者
    [textField removeObserver:self forKeyPath:@"text"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createControl
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(50, 100, 50, 50);
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)buttonClicked
{
    
    
#if 0
    //UIAlertView 提示框、警告框视图
    //iOS 8(包含)以前可以用，iOS 9 之后用UIAlertController
    //Title:提示的简单描述
    //message：提示的具体信息
    //delegate:代理
    //cancelButtonTitle：取消按钮的标题
    //otherButtonTitles：其他按钮的标题
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"弹出来也没什么用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"等等",nil];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    /*
     UIAlertViewStyleDefault = 0, 默认
     UIAlertViewStyleSecureTextInput, 带一个密文输入框
     UIAlertViewStylePlainTextInput, 带一个明文输入框
     UIAlertViewStyleLoginAndPasswordInput  带一个明文和一个密文输入框

     */
    //显示当窗口上
    [alertView show];
    
#else
    //iOS 9 以后
    //提示框控制器，有alerView模式 和 actionSheet 模式，注意一点就是 actionSheet 模式时，不能添加textField
    //Title:提示的简要信息
    //message:提示的具体内容
    if(alertVC)
    {
        //如果已经存在直接显示
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    
    alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"没什么好提示的" preferredStyle:UIAlertControllerStyleAlert];
    
    /*
     UIAlertControllerStyleActionSheet
     UIAlertControllerStyleAlert
     */
    /*
     UIAlertActionStyleDefault = 0, 默认
     UIAlertActionStyleCancel, 取消
     UIAlertActionStyleDestructive //销毁
     */
    //添加取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        NSLog(@"取消的操作");
        
    }];
    [alertVC addAction:cancelAction];
    //创建默认样式的按钮
   UIAlertAction *deAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"确定的操作");
    }];
    [alertVC addAction:deAction];
    
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"用户名";
    
    }];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        //设置密文输入
        textField.secureTextEntry = YES;
    }];
    
    UITextField *textField = alertVC.textFields[0];
    //添加一个观察，监听textField的文字变化的对象self，调用text set方法且text有变化才会调用观察者的回调方法
    //forKeyPath：监听的属性
    //options： 触发色时机
    
    /*
    [textField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
        deAction.enabled = NO;
     */
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
    UITextField *textField = notify.object;
    UIAlertAction *sureA = alertVC.actions[1];
    if (textField.text.length) {
        sureA.enabled = YES;

    }else
    {
        sureA.enabled = NO;
    }
}


#pragma mark -观察者的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //keyPath：观察的属性
    //object对应添加观察者的对象
    //change：改变的信息
    //context:描述
    
    
    if ([keyPath isEqualToString:@"text"]) {

        UITextField *textFiled = object;
        if (textFiled.text.length) {
            //拿到alertVC的所有UIAlertAction
            NSArray *actionArry = alertVC.actions;
            UIAlertAction *sureA = actionArry[1];
            //设置确定按钮可以点击
            sureA.enabled = YES;
            
        }else
        {
            NSArray *actionArry = alertVC.actions;
            UIAlertAction *sureA = actionArry[1];
            //设置确定按钮可以点击
            sureA.enabled = NO;
        }
        
    }
}




//返回输入框下第一个按钮是否可以点击，返回YES可以，返回NO不可以
-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    UITextField *textField = [alertView textFieldAtIndex:0];
    UITextField *textField1 = [alertView textFieldAtIndex:1];
    if(textField.text.length && textField1.text.length){
        return YES;//用户名和密码都存在可点击
    }
    
    return NO;
}

//当点击提示框上某一个按钮时调用这个方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //从0开始，对应按钮的顺序是从取消按钮依次对应提示框上的按钮
    switch (buttonIndex) {
        case 0:
        {
            //点击取消按钮
            NSLog(@"取消按钮被点击");
        }
            break;
        case 1:
        {
            NSLog(@"确定按钮被点击");
            //那大第一个输入框
            UITextField *textField = [alertView textFieldAtIndex:0];
            UITextField *textField1 = [alertView textFieldAtIndex:1];
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
