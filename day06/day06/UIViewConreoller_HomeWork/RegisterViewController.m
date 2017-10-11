//
//  RegisterViewController.m
//  UIViewConreoller_HomeWork
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserInfo.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#define VALUE arc4random() % 256 /255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
    [self createLabels];
    [self createTextField];
    [self createButtons];
}
-(void)createButtons
{
    NSArray *titleArray = @[@"注  册",@"返  回"];
    for (int i = 0; i < titleArray.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        //设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        //设置frame
        button.frame = CGRectMake(80 + i * 130, 430, 80, 50);
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
            [self saveUserInfo];
        }
            break;
        case 1:
        {
            //返回
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}
-(void)saveUserInfo
{
    UITextField *textField1 = (id)[self.view viewWithTag:100];
    UITextField *textField2 = (id)[self.view viewWithTag:101];
    UITextField *
    textField3 = (id)[self.view viewWithTag:102];
    //苹果采用沙盒运行机制，应用程序被安装之后，有独立的文件夹，只有应用程序本身能够直接访问沙盒中得数据和信息，其他应用程序时不可以访问的，如果需要用其他应用程序的数据，要求授权
    //存放到沙盒路径下的Documents文件夹下
    NSString *path = [NSString stringWithFormat:@"%@/Documents/UserInfo.plist",NSHomeDirectory()];
    
    UserInfo *newUser = [[UserInfo alloc]init];
    newUser.userName = textField1.text;
    newUser.password = textField2.text;
    newUser.email = textField3.text;
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    //取出已有用户
    NSArray *oldUsers = [NSArray arrayWithContentsOfFile:path];
    BOOL isHaven = NO;//标记当前用户是否已经被注册
    for ( NSData *data in oldUsers) {
        //反归档
        UserInfo *oldUser = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //判断用户是否存在
        if([newUser.userName isEqualToString:oldUser.userName]){
            isHaven = YES;
            NSLog(@"该用户已存在，不能再注册");
            break;//结束循环
        }
        
    }
    if(isHaven == NO)
    {
        //先把旧的用户添加进去,否则永远只存下一个用户
        [newArray addObjectsFromArray:oldUsers];
        //归档成为NSData
        NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:newUser];
        [newArray addObject:userData];
        //写入文件
        [newArray writeToFile:path atomically:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)createTextField
{
    for (int i = 0; i < 3; i++)
    {
        UITextField *textField = [[UITextField alloc]init];
        textField.frame = CGRectMake(130, 150 + i * 100, self.view.frame.size.width - 180, 35);
        //设置标记
        textField.tag = 100 + i;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textField];
        if (i == 0) {
            textField.placeholder = @"输入用户名";
        }else if(i == 1)
        {
            textField.placeholder = @"输入密码";
            // 设置密文输入
            textField.secureTextEntry = YES;
            
        }else{
            
            textField.placeholder = @"输入邮箱";
        }
    }

}

-(void)createLabels
{
    NSArray *textArray = @[@"用户名",@" 密  码 ",@" 邮  箱 "];
    for (int i = 0; i < textArray.count; i++)
    {
        UILabel *label = [[UILabel alloc]init];
        //设置位置和大小
        label.frame = CGRectMake(50, 150 + i * 100, 60, 35);
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
