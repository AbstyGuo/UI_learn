//
//  ViewController.m
//  UIButtonDemo
//
//  Created by student on 15-11-17.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//当一个视图控制器被加载完成时，会调用这个方法，在这里添加你的视图
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //UIButton 继承与UIControl ,间接的继承与UIView
    //用类方法创建系统样式的按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //设置frame
    button.frame = CGRectMake(50, 50, 50, 50);
    [self.view addSubview:button];
    
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(50, 130, 100, 40)];
    //设置背景颜色
    button1.backgroundColor = [UIColor cyanColor];
    
    //设置标题
    //普通状态的标题
    [button1 setTitle:@"按钮" forState:UIControlStateNormal];
    //点中高亮状态的标题
    [button1 setTitle:@"点中按钮" forState:UIControlStateHighlighted];
    
    //设置标题颜色
    //普通状态标题颜色
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    //高亮状态标题颜色
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //设置选中状态的标题颜色，需要结合selected属性一起设置才有效
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    button1.selected=YES;
    //设置失效状态的标题颜色，需要设置enabled属性为NO，否则看不出效果
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
//    button1.enabled =NO;
    //设置按钮的图片
    //设置背景图
    //设置普通状态的背景图片
    [button1 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
    //设置高亮状态的图片
    [button1 setBackgroundImage:[UIImage imageNamed:@"h.png"] forState:UIControlStateHighlighted];
    //重设frame
    button1.frame=CGRectMake(100, 130, 80, 80);
    //设置前置图片
    [button1 setImage:[UIImage imageNamed:@"front.png"] forState:UIControlStateNormal];
    //设置前置高亮图片
    [button1 setImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:button1];
    
    //给按钮添加事件
    //Target: 按钮触发事件时，执行方法的对象
    //第二个参数action: 点击按钮时触发的方法
    //Events: 触发时机
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    /**
     *  UIControlEventTouchUpInside  点击按钮按下，松手之后触发
     *  UIControlEventTouchDown      点下去就触发
     *  UIControlEventTouchDownRepeat 点击两次触发一次
     *  UIControlEventTouchDragEnter  点击拖出边界，再往按钮里拖拽，进入边界时触发
     *  UIControlEventTouchDragExit   点击往按钮边界拖拽，超出边界时触发
     *  UIControlEventTouchDragInside 点击在范围内拖拽触发
     *  UIControlEventTouchDragOutside点击在边界外拖拽
     *  UIControlEventTouchUpOutside  按下之后，在外部松手时触发
     */
    
    //创建一个label，用于显示按钮点击次数
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 200, 40)];
    label.textColor =[UIColor redColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.text =@"点点按钮";
    label.tag = 30;
    [self.view addSubview:label];
    
    UIButton * button2 = [[UIButton alloc]initWithFrame:CGRectMake(180, 130, 50, 50)];
    button2.backgroundColor = [UIColor greenColor];
    //设置标记，在点击事件中，区分不同的按钮
    button2.tag = 10;
    button1.tag = 20;
    //添加点击事件,传参数的情况
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    //添加点击事件，且不带参数
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];

}

-(void)changeColor
{
#define  VALUE  arc4random() % 256/255.0f
    //创建一个随机颜色  第四个参数表示透明度
    UIColor * color =[UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    self.view.backgroundColor = color;
}

//按钮的触发事件
-(void)buttonClicked:(UIButton *)sender
{
    static int count = 0;
    UILabel * label = (id)[self.view viewWithTag:30];
    if (sender.tag==20)
    {
        label.text=[NSString stringWithFormat:@"点击%d次",++count];
    }
    else
    {
        label.text=[NSString stringWithFormat:@"点击%d次",--count];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
