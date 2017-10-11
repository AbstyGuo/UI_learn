//
//  ViewController.m
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "BookCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置导航条样式
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //设置导航条不透明
    self.navigationController.navigationBar.translucent = NO;
    //读取数据源
    [self readDataSource];
    [self createTableView];
    
}
-(void)readDataSource
{
    //初始化数据源数组
    _dataSource = [[NSMutableArray alloc]init];
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"bookData" ofType:@"plist"];
    //读取信息
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    [_dataSource addObjectsFromArray:array];
}

-(void)createTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //指定数据源代理
    tableView.dataSource = self;
    //指定代理
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
#pragma mark - UITableViewDataSource Methods
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}
//创建或刷新侧cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BookCell";
    //tableView到复用池中查找cell
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //创建新的cell
        cell = [[BookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //找到显示行对应的字典
    NSDictionary *dict = [_dataSource objectAtIndex:indexPath.row];
    //刷新显示内容
    [cell refreshViewWith:dict];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
