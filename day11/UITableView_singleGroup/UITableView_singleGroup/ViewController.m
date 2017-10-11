//
//  ViewController.m
//  UITableView_singleGroup
//
//  Created by MS on 15-11-28.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>//遵循两个协议
{
    NSMutableArray * _dataSource;//数据源数组，存放城市名字
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UITableView表格视图，继承于UIScrollView，通常用来显示具有某种规律的数据模型的某些属性，不用显示模型的全部属性
    //复用机制：tableView中显示的一行叫做cell，cell是可以复用的，当刷新或创建cell时按照复用ID进行创建或复用，在tabelView中只会创建有限个cell，当不显示在屏幕上的cell就会被回收到复用池中（空闲状态）
    
    //UITableView 带两个协议的视图控件，一个是数据源代理，数据源代理中有两个必须实现的方法，数据源代理主要是从数据源代理中获取总共要显示的行数，以及每一行要显示的数据或内容；另一个是操作代理：对cell进行操作时的协议
    
    //读取数据
    [self readDataSource];
    //创建UITableView
    [self createTableView];

}

#pragma mark - 实现函数
-(void)readDataSource
{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"cityArray" ofType:@"plist"];//获取文件路径
    //将文件中的城市名字存入数据源数组中
    _dataSource = [NSMutableArray arrayWithContentsOfFile:path];
}

#pragma mark - 创建tableView
-(void)createTableView
{
    //创建 tableView 并指定 style有两中风格
    //UITableViewStylePlain,  扁平风格
    //UITableViewStyleGrouped   分组风格
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //指定数据源代理
    tableView.dataSource = self;
    //指定普通代理
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
}

#pragma mark -UITableViewDataSource Methods
//关于数据源代理的方法
//返回tableView第section组总共显示多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;//返回城市个数
}

//刷新显示某一行时调用这个方法  indexPath表示cell在tableView中的位置：indexPath.section第几组，indexPath.row第几行
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cell的复用ID
    static NSString * cellID = @"cellID";
    static int i = 0;
    //让tableView用cellID到复用池中查找空闲的cell，如果有就刷新数据并用来显示，如果没有空闲的cell，去创建新的cell，并标记cell的复用ID为cellID
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)//没有找到可用的cell
    {
        //创建新的cell并指定风格和复用ID
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        /* 
         UITableViewCellStyleDefault,
         UITableViewCellStyleValue1,
         UITableViewCellStyleValue2,
         UITableViewCellStyleSubtitle
         */
    }
    //用cell显示城市名字
    //取出对应的城市名字显示，就一组的时候indexPath.section恒为0；
    cell.textLabel.text = _dataSource[indexPath.row];
    //设置文字颜色
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;//返回cell供给tableView用来显示
}

#pragma mark - UITableViewDelegate Method
//选中某一行时调用这个方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //找到相应位置的cell
//    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString * content = _dataSource[indexPath.row];
    NSLog(@"选中：%@",content);
}
//取消选中某一行时调用的方法
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
