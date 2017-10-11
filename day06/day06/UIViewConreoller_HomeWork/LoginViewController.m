//
//  LoginViewController.m
//  UIViewConreoller_HomeWork
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ViewController.h"
#import "UserInfo.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLables];
    [self createTextFields];
    [self createButtons];
    
#define VALUE arc4random() % 256 /255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
    
    
}
-(void)createButtons
{
    NSArray *titleArray = @[@"注  册",@"登  录"];
    for (int i = 0; i < titleArray.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        //设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        //设置frame
        button.frame = CGRectMake(80 + i * 130, 380, 80, 50);
        //设置标题字体
        button.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        //设置标题颜色
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //添加点击事件
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 200 + i;
        [self.view addSubview:button];
    }
}
-(void)buttonClicked:(UIButton *)button
{
    switch (button.tag - 200) {
        case 0:
        {
            //创建注册界面
            RegisterViewController *rvc = [[RegisterViewController alloc]init];
            rvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            //跳转到注册界面
            [self presentViewController:rvc animated:YES completion:nil];
            
        }
            break;
        case 1:
        {
            [self login];
        }
            break;
        default:
            break;
    }
}
-(void)login
{
    UITextField *textField1 = (id)[self.view viewWithTag:100];
    UITextField *textField2 = (id)[self.view viewWithTag:101];
    
    //取出所有已存在的用户
    NSString *path = [NSString stringWithFormat:@"%@/Documents/UserInfo.plist",NSHomeDirectory()];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    BOOL isHaven = NO;//标记用户是否存在
    BOOL isError = NO;// 标记密码是否错误
    for(NSData *data in array)
    {
        UserInfo *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if ([user.userName isEqualToString:textField1.text]) {
            isHaven = YES;
            if (![user.password isEqualToString:textField2.text]) {
                isError = YES;
            }
            //结束循环
            break;
        }
    }
    if(isHaven && isError == NO)
    {
        ViewController *vc = [[ViewController alloc]init];
        //把用户名传到主界面
        vc.userName = textField1.text;
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:vc animated:YES completion:nil];
    }else if(isHaven == NO)
    {
        NSLog(@"用户不存在");
    }else
    {
        NSLog(@"密码错误");
    }
   
}


-(void)createTextFields
{
    for (int i = 0; i < 2; i++)
    {
        UITextField *textField = [[UITextField alloc]init];
        textField.frame = CGRectMake(130, 180 + i * 100, self.view.frame.size.width - 180, 35);
        //设置标记
        textField.tag = 100 + i;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textField];
        if (i == 0) {
           textField.placeholder = @"输入用户名";
        }else
        {
           textField.placeholder = @"输入密码";
            // 设置密文输入
            textField.secureTextEntry = YES;
        }
    }
}

-(void)createLables
{
    NSArray *textArray = @[@"用户名",@" 密  码 "];
    
    for (int i = 0; i < textArray.count; i++)
    {
        UILabel *label = [[UILabel alloc]init];
        //设置位置和大小
        label.frame = CGRectMake(50, 180 + i * 100, 60, 35);
        //设置显示文字
        label.text = textArray[i];
        
        //设置字体
        label.font = [UIFont boldSystemFontOfSize:18];
        //设置字体颜色
        label.textColor = [UIColor blackColor];
        [self.view addSubview:label];
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
