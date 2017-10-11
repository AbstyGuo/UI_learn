//
//  ViewController.m
//  UICollectionView_Base
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "DetailViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray * _dataSource;//数据源数组
    UICollectionView * _collectionView;
    //iOS6之后出现的网格或集合视图，继承于UIScrollView，多用于显示大小不一致的图片，可以滚动
    //创建UICollectionView的对象时，需要一个布局类对象UICollectionViewLayout
    //UICollectionViewLayout布局类，是苹果提供的一个抽象类，具体使用时用继承于UICollectionViewLayout类的对象
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataSource];
    [self createCollectionView];//创建集合视图
}

#pragma mark - 加载数据
- (void)createDataSource
{
    _dataSource = [[NSMutableArray alloc]init];//初始化数据源数组
    for (int i = 0; i < 16; i++) {
        NSString * imageName = [NSString stringWithFormat:@"10_%d.jpg",i];
        //把图片名存放到数据源中
        [_dataSource addObject:imageName];
    }
}

#pragma mark - 创建视图
- (void)createCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //UICollectionViewFlowLayout  继承于UICollectionViewLayout 是一个网格布局类
    
    //设置滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    /*
     UICollectionViewScrollDirectionHorizontal  横向滚动
     UICollectionViewScrollDirectionVertical    纵向滚动
     */
    //设置最小列间距
    flowLayout.minimumInteritemSpacing = 5;
    //设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //指定数据源代理
    _collectionView.dataSource = self;
    //指定代理
    _collectionView.delegate = self;
    //把集合视图添加到当前视图控制器上
    [self.view addSubview:_collectionView];
    
    //注册复用的网格视图，提前告诉_collectionView，让_collectionView知道自己要显示什么类型的视图
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"myCell"];
}

#pragma mark - 关于数据源协议的方法
//返回一组显示的网格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

//刷新或创建网格（item或cell）的方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"myCell";
    //让collectionView到相应的复用池中查找是否有空闲的网格视图可使用，有就直接用，没有会直接创建新的返回
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //index是刷新的网格在collectionView中的位置
    //两个参数indexPath.section 组的下标  和 indexPath.item 在组中的位置坐标
    cell.imageName = _dataSource[indexPath.item];
    cell.title = [NSString stringWithFormat:@"第%ld个item",indexPath.item];
    return cell;
}

//返回某一个网格的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 160);
    //注意返回的网格的大小不要超出collectionView的frame的大小
}

//返回留出的边界距离 上左下右
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 10,0, 10);
}
//某一组的最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//某一组的最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

#pragma mark - 选中某一个网格时的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detail = [[DetailViewController alloc]init];
    detail.imageName = _dataSource[indexPath.item];
    //取消选中某一个item
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
