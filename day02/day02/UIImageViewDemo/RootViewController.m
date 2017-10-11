//
//  RootViewController.m
//  UIImageViewDemo
//
//  Created by 夏婷 on 15/11/17.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSTimer *_timer;// 协助imageView从左下角飞向右上角
}
@end

@implementation RootViewController

//视图被加载完成时调用这个方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //通过图片设置背景颜色，但是图片尺寸必须和平面大小刚好合适，否侧是平铺填满
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back2.jpg"]];
    
    //UIImageView图片视图，用于显示图片对象的类，继承于UIView
    //UIImage iOS中得图片类，不能直接用于显示，需要借助于UIImageView的对象，UIImageView和UIImage的关系，类似于UILabel和NSString
    //初始化图片视图
    UIImageView *imageView = [[UIImageView alloc]init];
    //设置其实位置和大小
    imageView.frame = CGRectMake(50, 100, 100, 100);
    //设置背景颜色
    imageView.backgroundColor = [UIColor yellowColor];
    
    //UIImage  图片类
    //第一种创建图片对象的方式
    //这种创建方式，图片会被缓存在内存中，不会被释放，占用内存，通常这种方式创建图片用于长期不变，并且大量重复使用的图片，试用于小图片
#if 0
    UIImage *image = [UIImage imageNamed:@"DOVE 1.png"];
    //设置图片视图显示的图片对象
//    imageView.image = image;
#else
    //第二种创建方式
    //获取图片的路径
    //NSBundle mainBundle] 应用程序的包
    //在应用程序的包中查找相应的文件，并返回文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DOVE 1" ofType:@"png"];
    //第1种
    //读取图片数据
    NSData *imageData = [NSData dataWithContentsOfFile:path];
    //用图片数据创建一个图片对象
    UIImage *image = [UIImage imageWithData:imageData];
//    imageView.image = image;
    
    //第2种：直接读取图片文件，并创建图片对象
    UIImage *image1 = [[UIImage alloc]initWithContentsOfFile:path];
    imageView.image = image1;
    //取出图片尺寸
    CGSize  size = image1.size;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    //重设frame
    imageView.frame = CGRectMake(0, screenSize.height - size.height, size.width, size.height);
    
    //重设背景颜色
    imageView.backgroundColor = [UIColor clearColor];
    
    //设置图片视图的填充模式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    /**
     *UIViewContentModeScaleToFill  拉伸或压缩填满,如果过大就是被压缩，过小就是被拉伸,填满图片视图，不会超出边距
     *UIViewContentModeScaleAspectFill 按比例填满，会超出边界
     *UIViewContentModeScaleAspectFit  //按比例填充，会保证图片的比例，但是压缩或放大时，只能保证一个方向上填满图片视图
     
     */
    //裁剪边界，把超出图片视图范围的部分裁剪掉，不显示
    imageView.clipsToBounds = YES;
    //设置图片的标记
    imageView.tag = 10;
    
#endif
    
    [self.view addSubview:imageView];
    
    
    //添加图片动画
    [self addAnimation];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(fly) userInfo:nil repeats:YES];
}
-(void)fly
{
    UIImageView *imageView = (id)[self.view viewWithTag:10];
    CGRect frame = imageView.frame;
    CGSize size = [UIScreen mainScreen].bounds.size;
    //设置移动的偏移量
    CGFloat x = 1, y = 1.5;
    
    if (frame.origin.x > size.width ) {//如果超出屏幕回到左下角
        
        frame.origin = CGPointMake(-frame.size.width, size.height + frame.size.height);
    }
    frame.origin.x += x;
    frame.origin.y -= y;
    imageView.frame = frame;
}
-(void)addAnimation
{
    //找到图片视图
    UIImageView *imageView = (id)[self.view viewWithTag:10];
    //所谓动画就是在极短的时间内，在图片视图上切换显示连续动作的图片对象
    //1.需要一直连续动作的图片
    //初始化可变数组，用于管理动画图片组
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    for(int i = 1; i <= 18; i++)
    {
        //获取图片路径
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"DOVE %d",i] ofType:@"png"];
        //读取图片数据
        NSData *imageData = [NSData dataWithContentsOfFile:path];
        //创建图片对象
        UIImage *image = [UIImage imageWithData:imageData];
        [imageArray addObject:image];
    }
    //1.1设置切换的图片数组
    imageView.animationImages = imageArray;
    
    //2.设置切换动画的总时长，每0.1秒切换一张图片
    imageView.animationDuration = 0.1 * imageArray.count;
    //3,设置动画的重复次数,0表示无限次
    imageView.animationRepeatCount = 0;
    
    //4.启动动画
    if(![imageView isAnimating]){//如果没有执行动画，启动动画
        
        [imageView startAnimating];
        
    }
    
    /**
     - (void)startAnimating;//启动动画
     - (void)stopAnimating;//停止动画
     - (BOOL)isAnimating;// 返回是否正在执行动画
     */
    
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
