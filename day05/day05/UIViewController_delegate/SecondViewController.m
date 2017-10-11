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
    
    if (_delegate && [_delegate respondsToSelector:@selector(showText:)]) {
        //6.驱动方驱动代理调用协议方法
        [_delegate showText:_textFiled.text];
    }
    
   UIColor *color = [_delegate colorForShowText:_textFiled.text];
    self.view.backgroundColor = color;
    
    //退出当前界面
//    [self dismissViewControllerAnimated:YES completion:nil];
    
  //延迟3秒再退出当前界面
    [self performSelector:@selector(dismissViewControllerAnimated:completion:) withObject:@NO afterDelay:3];
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
