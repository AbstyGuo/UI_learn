//
//  DoubleViewController.m
//  UIGesture_base
//
//  Created by 夏婷 on 15/11/26.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "DoubleViewController.h"

@interface DoubleViewController ()<UIGestureRecognizerDelegate>
//手势协议方法

@end

@implementation DoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [self getMyImageView];
    //创建缩放手势
    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    //设置代理
    pinch.delegate = self;
    //创建旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    //设置代理
    rotation.delegate = self;
    
    [imageView addGestureRecognizer:pinch];
    
    [imageView addGestureRecognizer:rotation];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(50, 50, 100, 100);

    button.tag = 80;
    //添加事件
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    button.backgroundColor = [UIColor redColor];
    [imageView addSubview:button];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
    // 设置触发点击的次数
    tap.numberOfTapsRequired = 1;
    //设置点击的手指个数
    tap.numberOfTouchesRequired = 1;
    [button addGestureRecognizer:tap];

}
-(void)taped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"响应点击手势");
}

-(void)buttonClicked
{
    NSLog(@"响应按钮点击事件");
}

//缩放手势的触发方法
-(void)pinch:(UIPinchGestureRecognizer *)gesture
{
    NSLog(@"缩放方法");
    
    //通过设置形变属性来实现缩放，上一次的基础上进行缩放，设置形变的方法应该用可叠加的方法
    //取出承载手势的视图
    UIImageView *imageView = (id)gesture.view;
    
    imageView.transform = CGAffineTransformScale(imageView.transform, gesture.scale, gesture.scale);
    //重置缩放倍数
    [gesture setScale:1];
    
}
//旋转手势的触发方法
-(void)rotation:(UIRotationGestureRecognizer *)gesture
{
    NSLog(@"旋转方法");
    //叠加旋转，在上一次旋转的基础上再旋转
    //获取承载手势的视图
    UIImageView *imageView =(id) gesture.view;
    
    imageView.transform = CGAffineTransformRotate(imageView.transform, gesture.rotation);
    
    // 重置手势的旋转量
    [gesture setRotation:0];
    
}
//返回是否支持多手势，YES支持，返回NO，是不支持
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

#pragma mark -事件冲突时解决方法

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    //通过这个方法返回触摸是否被识别成手势，返回YES，识别成手势，返回NO识别成普通的触摸
    
    if(touch.view.tag == 80)
    {
        //识别成手势
        return YES;
    }else
    {
        //识别为普通的触摸
        return NO;
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
