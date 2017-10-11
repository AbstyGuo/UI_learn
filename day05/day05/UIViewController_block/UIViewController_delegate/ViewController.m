//
//  ViewController.m
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"

/**
 *  使用block应注意 <区分开驱动方和 被动方>
    1.驱动方声明block,注意关键词用copy
    2.被动方实现block，完成指定功能，注意：注意强强引用
    3.驱动声明的block属性，指向被动方实现的block
    4.驱动方在合适的时机调用block
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建按钮，触发跳转
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, self.view.frame.size.width - 200, 50)];
    //设置标题
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"去输入";
    //字体适应宽度
    label.adjustsFontSizeToFitWidth = YES;
    //设置文字颜色
    label.textColor = [UIColor blackColor];
    label.tag = 10;
    [self.view addSubview:label];
    
}
//实现跳转
-(void)buttonClicked
{
    
    //创建视图控制器
    SecondViewController *svc = [[SecondViewController alloc]init];
    

    
   // myBlock 在 ViewController的对象 中实现，ViewController的对象 对myBlock进行了引用
    
    //因为myBlock是copy修饰的，myBlock会对在代码块中的对象进行强引用， 对self也会进程强引用
    
    //为了解决强强引用，当我们要在代码块中用到myBlock的实现所在的对象时，应该用__weak 或 __unsafe_unretained 去修饰这个对象，让myBlock对它进行引用时，只进行弱引用
    
    __weak ViewController *vc = self;
    //2.ViewController 实现block,完成相应的功能
    UIColor *(^myBlock)(NSString * text) = ^(NSString *text){
        
        vc.view.backgroundColor = [UIColor magentaColor];
        UILabel *label = (id)[vc.view viewWithTag:10];
        label.text = text;
        return [UIColor greenColor];
    };
    
    //3.指定block
    svc.showTextBlock = myBlock;
    
    // 设置跳转动画类型
    svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //跳转到第二视图控制器
    [self presentViewController:svc animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
