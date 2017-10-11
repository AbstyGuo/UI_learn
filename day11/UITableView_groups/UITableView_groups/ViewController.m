//
//  ViewController.m
//  UITableView_groups
//
//  Created by MS on 15-11-28.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>//遵循协议
{
    NSMutableArray * _dataSource;//数据源数组，存放四组图片的数组
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readDataSource];
    //创建tableView,并指定风格为分组风格
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //指定代理
    tableView.delegate = self;
    tableView.dataSource = self;
    //设置行高,通过属性设置的行高，每一行都这么高
    tableView.rowHeight = 100;
    //设置组的头视图高度
    tableView.sectionHeaderHeight = 60;
    //设置自适应，让视图自动留出导航条的高度
    self.automaticallyAdjustsScrollViewInsets = YES;
    //添加视图
    [self.view addSubview:tableView];
}

//读取数据
-(void)readDataSource
{
    //图片信息的plist文件数组
    NSArray * files = @[@"image_圣斗士",@"image_海贼",@"image_火影忍者",@"image_美女"];
    //初始化数据源数组
    _dataSource = [[NSMutableArray alloc]init];
    for (NSString * fileName in files) {
        //获取文件路径
        NSString * path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"plist"];
        //管理一组图片数据的小数组
        NSMutableArray * sectionArray = [NSMutableArray arrayWithContentsOfFile:path];
        //把管理组的数组放到数据源中
        [_dataSource addObject:sectionArray];
    }
}

#pragma mark - 关于数据源的协议方法
//返回要显示的组数，分几组显示数据时必须要写的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    _dataSource存放者四个数组，每一个数组对应一组图片
    return _dataSource.count;
}

//返回某一组显示的总行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    section组的下标
    NSArray * sectionArray = _dataSource[section];
    //返回数组中图片的张数
    return sectionArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    //tableView到复用池中查找是否有可以使用的cell,如果有直接刷新显示数据并使用，没有就创建新的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell== nil) {
        //创建新的cell并指定复用ID为cellID
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        /*
         UITableViewCellStyleDefault    带图片和一个label
         UITableViewCellStyleSubtitle   带图片和两个label  纵向布局
         UITableViewCellStyleValue1     带图片和两个label  横向布局
         UITableViewCellStyleValue2     不带图片，有两个横向布局的label
         */
    }
    //获取组的数据源indexPath.section组下标
    NSMutableArray * sectionArray = [_dataSource objectAtIndex:indexPath.section];
    //获取组内数据源对应位置indexPath.row行下标
    NSDictionary * dic = [sectionArray objectAtIndex:indexPath.row];
    //取出图片名字
    NSString * imageName = [dic objectForKey:@"imageName"];
    //获取图片描述信息
    NSString * imageInfo = [dic objectForKey:@"imageInfo"];
    
//    NSString * path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"jpg"];
//    NSData * data = [NSData dataWithContentsOfFile:path];
//    cell.imageView.image = [UIImage imageWithData:data];
    cell.imageView.image = [UIImage imageNamed:imageName];//设置显示图片
    cell.textLabel.text = imageName;//设置主标题
    cell.detailTextLabel.text = imageInfo;//设置子标题
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
