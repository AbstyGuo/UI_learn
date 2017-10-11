//
//  SecondViewController.m
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UITextField * _textFiled;//成员变量，用于输入文字
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    _textFiled = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    //设置边框样式
    _textFiled.borderStyle = UITextBorderStyleRoundedRect;
    //字体自适应宽度
    _textFiled.adjustsFontSizeToFitWidth = YES;
    //设置最小字体
    _textFiled.minimumFontSize = 15;
    //设置字体
    _textFiled.font = [UIFont boldSystemFontOfSize:25];
    [self.view addSubview:_textFiled];
}

//触摸结束时调用此方法
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //_textFiled 放弃第一响应
    [_textFiled resignFirstResponder];
    
    //系统提供的一个单例，能将数据存储到本地，程序退出之后仍然存在
    
    //NSUserDefaults都支持那些数据类型的存储：所有的基本数据类型、NSString、NSArray、NSNumber 、NSDictionary、NSData 、NSDate,
    //
    
    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    //存BOOL值
//    [defauts setBool:YES forKey:@"key"];
    //存取NSInteger
//    [defauts setInteger:5 forKey:@"intgerkey"];
//    [defauts setDouble:4.5 forKey:@"key"];
//    [defauts setFloat:6.8 forKey:@"key"];
    
    
    //存储数据:存NSString、NSArray、NSNumber 、NSDictionary、NSData 、NSDate都可以调用下面这个方法
//    [defauts setValue:object forKey:@"key"];
    [defauts setObject:_textFiled.text forKey:@"showText"];
    // 同步数据
    [defauts synchronize];
    
    //注意一点：要存储继承于NSObject类的对象时，要循序NSCoding协议，实现编码和解码的代码的函数；
    //退出当前界面
    [self dismissViewControllerAnimated:YES completion:nil];
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
