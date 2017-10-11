//
//  ViewController.m
//  UIScrollView_reuse
//
//  Created by 夏婷 on 15/11/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "XTScrollView.h"


@interface ViewController ()<XTScrollViewDataSource,XTScrollViewDelegate>//遵循两个协议
{
    NSMutableArray *_dataSoure;// 管理数据源
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //读取数据源
    [self readDataSource];
    //创建自定义滚动视图
    [self createScrollView];
    
}

#pragma mark - 滚动视图相关的

-(void)createScrollView
{
    XTScrollView *scrollView = [[XTScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    // 指定获取子视图的代理
    scrollView.subViewDelegate = self;
    
    //指定数据源代理
    scrollView.dataSource = self;
    
//    //手动触发一次刷新
//    [scrollView reloadData];
    [self.view addSubview:scrollView];
    
}

#pragma mark -获取子视图的代理方法

-(UIView *)viewAtIndex:(NSInteger)index
{
    //创建图片，返回给自定义的滚动视图
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:_dataSoure[index]];
    return imageView;
}

#pragma mark - 数据源代理方法

-(NSInteger)numberOfPages
{
    //返回要显示的图片总张数
    return _dataSoure.count;
}
//刷新显示数据
-(void)refreshView:(UIView *)view atIndex:(NSInteger)index
{
    UIImageView *imageView = (id)view;
    imageView.image =[UIImage imageNamed:[_dataSoure objectAtIndex:index]];
}












#pragma mark -读取数据源
-(void)readDataSource
{
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image_火影忍者" ofType:@"plist"];
    //用数据读取内容
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    //初始化数据源数组，存储图片名字
    _dataSoure = [[NSMutableArray alloc]init];
    //遍历数组中存的图片信息
    for(NSDictionary *dic in array)
    {
        //取出图片名字
        NSString *imageName = [dic objectForKey:@"imageName"];
        //把图片名字存入数据源
        [_dataSoure addObject:imageName];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
