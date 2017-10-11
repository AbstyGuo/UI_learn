//
//  ViewController.m
//  UITableView_Search
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *_dataArray;//管理26组字符串数组
    ResultViewController *_resultVC;//显示搜的结果的视图控制
    UISearchController *_searchController;//搜索控制器  //管理搜索结果界面
    NSMutableArray * _resultArray;//管理搜索结果的数组
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建数据源
    [self createSource];
    
    [self createTableView];
    
}
#pragma mark -产生26组字符串

-(void)createSource
{
    _dataArray = [[NSMutableArray alloc]init];
    for (char i = 'A'; i <= 'Z'; i++)
    {
        //用于存一组字符串
        NSMutableArray *subArray = [[NSMutableArray alloc]init];
        for(char j = 0; j < 10; j++)
        {
#define CHAR 'A' + arc4random() % 26
            //产生后三位随机的字符串
            NSString *str = [NSString stringWithFormat:@"%c%c%c%c",i,CHAR,CHAR,CHAR];
            [subArray addObject:str];
        }
        //把一组字符串存到数据源中
        [_dataArray addObject:subArray];
    }
    
}
#pragma mark - 创建TableView
-(void)createTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    //指定数据源代理
    tableView.dataSource = self;
    //指定代理
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    //关于搜索的
    //创建显示搜索结果的视图控制器
    _resultVC = [[ResultViewController alloc]init];
    //创建搜索控制器
    _searchController =[[UISearchController alloc]initWithSearchResultsController:_resultVC];
    //获取搜索控制器的搜索条
    UISearchBar *seachBar = _searchController.searchBar;
    CGRect frame = seachBar.frame;
    //重设搜索条高度
    seachBar.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 44);
    //把搜索条作为TableView的头视图
    tableView.tableHeaderView = seachBar;
    
    //指定搜索条的代理
    seachBar.delegate = self;
}

-(void)searchText:(NSString *)text
{
    if (_resultArray == nil) {
        //初始化搜索结果数组
        _resultArray = [[NSMutableArray alloc]init];
    }
    //清空之前的搜索结果
    [_resultArray removeAllObjects];
    if(text == nil)
    {
        [_resultArray addObject:@"无搜索结果"];
        
    }else
    {
        //遍历26组字符串，找出满足搜索条件的字符串
        for(NSArray *subArray in _dataArray)
        {
            for (NSString *str in subArray)
            {
                if ([str hasPrefix:text]) {
                    
                    //如果str是以输入的文字text开头的，视为满足搜索添加的字符串
                    [_resultArray addObject:str];
//                    [str containsString:text]//只有包含text就返回YES
                }
            }
        }
        if([_resultArray count] ==0)
        {
            [_resultArray addObject:@"无搜索结果"];
        }
    }
    
    _resultVC.resultArray = _resultArray;
    //刷新显示数据
    [_resultVC.tableView reloadData];
}
//清空搜索结果的显示和数据
-(void)clearViewAndSource
{
    [_resultArray removeAllObjects];
    _resultVC.resultArray = nil;
    //清空视图
    [_resultVC.tableView reloadData];
    
}

#pragma mark - 关于搜索的协议方法
//当搜索条的text发生改变时调用这个方法
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //搜索
//    [self searchText:searchText];
    [self clearViewAndSource];
    
    
}
//当搜索按钮被点击时，调用这个方法，这个时候也可以出发搜索，通常网咯搜索时用这种方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //获取搜索框中的文字
    NSString *seachText = searchBar.text;
    //调用搜索功能
    [self searchText:seachText];
}
//当点击取消按钮时，调用这个方法，清空搜索结果，以保证下一次搜索结果正确
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [_resultArray removeAllObjects];
    //清空数据
    _resultVC.resultArray = nil;
    //清空视图
    [_resultVC.tableView reloadData];
    
}

#pragma mark -UITableViewDataSource Methods

//返回所要显示的组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataArray count];
}

//返回任意一组显示多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *subArray = [_dataArray objectAtIndex:section];
    //返回字符串个数
    return [subArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    //到复用池中找空闲的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //创建新的cell
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //取出组数据源
    NSArray *subArray = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text = [subArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -关于组头视图
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//组头视图标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%c",'A' +(char)section];
}

#pragma mark -关于索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *titleArray = [[NSMutableArray alloc]init];
    for (char i = 'A'; i <='Z'; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%c",i];
        [titleArray addObject:str];
    }
    return titleArray;//返回索引标题数组
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
