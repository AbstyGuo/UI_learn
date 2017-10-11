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
#import "HeaderView.h"
#import "HeaderScrollView.h"

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
    NSMutableArray * sectionArray1 = [[NSMutableArray alloc]init];//存放第一组图片名字
    NSMutableArray * sectionArray2 = [[NSMutableArray alloc]init];//存放第二组图片名字

    for (int i = 0; i < 16; i++) {
        NSString * imageName = [NSString stringWithFormat:@"10_%d.jpg",i];
        [sectionArray1 addObject:imageName];
        NSString * imageName1 = [NSString stringWithFormat:@"10_%d.jpg",15-i];
        [sectionArray2 addObject:imageName1];
        //把图片名存放到数据源中
//        [_dataSource addObject:imageName];
    }
    [_dataSource addObject:sectionArray1];
    [_dataSource addObject:sectionArray2];
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
//    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"myCell"];
    
    //通过xib文件注册为复用的item , 提前告诉_collectionView用xib文件作为cell的复用文件
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"myCell"];
    
    //注册组的头视图
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    //注册第0组的头视图
    [_collectionView registerClass:[HeaderScrollView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header0"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

#pragma mark - 组的头视图和尾视图的相关协议方法
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            static NSString * headerID = @"header0";
            HeaderScrollView * scrollView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
            NSMutableArray * array =_dataSource[indexPath.section];
            scrollView.imageArray = array;
            return scrollView;
        }else
        {
            static NSString * headerID = @"header";
            //到头视图的复用池查找是否有空闲的头视图可用，如果有就用，没有就创建新的头视图
            HeaderView * header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
            header.titleLabel.text = [NSString stringWithFormat:@"第%ld组头视图",indexPath.section];
            return header;
        }
    }else
    {
        //尾视图
        NSString * footerID = @"footer";
        //到尾视图的复用ID中查找空闲的尾视图
        HeaderView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
        footerView.titleLabel.text = [NSString stringWithFormat:@"第%ld组尾视图",indexPath.section];
        footerView.titleLabel.font = [UIFont systemFontOfSize:15];
        footerView.backgroundColor = [UIColor grayColor];
        return footerView;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(0, 220);
    }else
    {
        return CGSizeMake(0, 40);
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 30);
}

#pragma mark - 关于数据源协议的方法
//返回一个有几组图片
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataSource.count;
}
//返回一组显示的网格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataSource[section] count];
}

//刷新或创建网格（item或cell）的方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"myCell";
    //让collectionView到相应的复用池中查找是否有空闲的网格视图可使用，有就直接用，没有会直接创建新的返回
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //index是刷新的网格在collectionView中的位置
    //两个参数indexPath.section 组的下标  和 indexPath.item 在组中的位置坐标
    
    cell.imageName = _dataSource[indexPath.section][indexPath.item];
    cell.title = [NSString stringWithFormat:@"第%ld组 %ld个",indexPath.section,indexPath.item];
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
    if (section==0) {
        return 20;
    }
    else
    return 20;
}

#pragma mark - 选中某一个网格时的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detail = [[DetailViewController alloc]init];
    detail.imageName = _dataSource[indexPath.section][indexPath.item];
    //取消选中某一个item
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
