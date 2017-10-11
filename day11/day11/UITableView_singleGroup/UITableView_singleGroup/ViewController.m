//
//  ViewController.m
//  UITableView_singleGroup
//
//  Created by 夏婷 on 15/11/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>//遵循协议和数据源协议
{
    NSMutableArray *_dataSource;//数据源数组，存放城市名字
}
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UITableView表格视图，继承于UIScrollView,通常用来显示具有某种规律的数据模型的某些属性，不用显示模型的全部属性
    
    //复用机制：UITableView中显示的一行叫做cell,cell是可以复用的，当刷新或创建cell时按照复用ID进行复用，在tableView中只会创建有限个cell,当不显示在屏幕上的cell就会回收到复用池中（空闲状态）
    
    //UITableView 带两个协议的视图控件，一个是数据源代理，数据代理主要是从代理对象中获取总共要显示的行数，已经每一行要显示的数据； 操作代理：对cell进行操作时的协议
    
    
    
    //读取数据
    [self readDataSource];
    //创建UITableView
    [self creatTableView];
    
    
}
#pragma mark -读取数据

-(void)readDataSource
{
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityArray" ofType:@"plist"];
    
    //将文件中得城市名字存入数据源数组中
    _dataSource = [NSMutableArray arrayWithContentsOfFile:path];
}

#pragma mark -  创建tableView
-(void)creatTableView
{
    //创建tableView并指定frame和风格
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    /*
     UITableViewStylePlain 扁平风格
     UITableViewStyleGrouped 分组风格
     */
    //指定数据源代理
    tableView.dataSource = self;
    
    //指定代理
    tableView.delegate = self;
    
    
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource Methods
//返回tableView第section组总共显示多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
    // 返回城市个数
}
//刷新显示某一行时调用这个方法，indexPath表示cell在tableView中得位置，indexPath.section在第几组，indexPath.row 在 第几行
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cell的复用ID
    static NSString *cellId = @"cellID";
    //让tableView用cellId到复用池中查找空闲的cell,如果有就刷新数据，并用来显示；如果没有空闲的cell,去创建新的cell,并标记cell的复用ID为cellId
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil){//没有找到可用的cell
        //创建新的cell 并指定风格和复用cell
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        static int i = 0;
        NSLog(@"创建第%d个cell",++i);
        /**
         *  UITableViewCellStyleDefault
         *  UITableViewCellStyleSubtitle
         *  UITableViewCellStyleValue1
         *  UITableViewCellStyleValue2
         */
    }
    
    //用cell显示城市名字
    //取出对应的城市名字显示，indexPath.row在第几行
    cell.textLabel.text = _dataSource[indexPath.row];
    //设置文字颜色
    cell.textLabel.textColor = [UIColor blackColor];
    //返回cell共给tableView用来显示
    return cell;
}

#pragma mark - UITableViewDelegate Method

//选中某一行时调用这个方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //找到相应位置的cell
//    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"选中：%@",cell.textLabel.text);

    NSString *content = _dataSource[indexPath.row];
    NSLog(@"选中：%@",content);

    
}

//tableView取消选中某一行时调用的方法
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
