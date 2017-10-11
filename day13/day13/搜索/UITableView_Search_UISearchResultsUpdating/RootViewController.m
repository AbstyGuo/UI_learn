//
//  RootViewController.m
//  UITableView_SearchBar
//
//  Created by 夏婷 on 15/9/5.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"
#import "MyTableViewController.h"
@interface RootViewController ()<UISearchResultsUpdating>

@end

@implementation RootViewController
{
    UITableView *_tableView;//用来显示所有数据源的
    NSMutableArray *_dataArray;//数据源
    
    UISearchController *_searchController;//搜索控制器
    
    MyTableViewController *_seachResultVc;//显示搜索结果视图
    NSMutableArray *_searchResult;//搜索结果的数组
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数据源
    [self createDataSource];
    //创建TableView
    [self createTableview];
    
}
-(void)createDataSource
{
    _dataArray = [[NSMutableArray alloc]init];
    for (char i = 'A'; i <= 'Z';i++)
    {
        NSMutableArray *subArray = [[NSMutableArray alloc]init];
        for (int j = 0; j < 10; j++)
        {
            NSString *str = [NSString stringWithFormat:@"%c%c%c%c",i,'A' + arc4random() % 26,'A' + arc4random() % 26,'A' + arc4random() % 26];
            [subArray addObject:str];
        }
        [_dataArray addObject:subArray];
    }
}
#pragma mark - 创建TableView
-(void)createTableview
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, size.width, size.height - 20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //创建显示搜索结果的视图
   _seachResultVc = [[MyTableViewController alloc]init];
    //创建搜索控制器，并给它一个显示搜索结果的视图
    _searchController = [[UISearchController alloc]initWithSearchResultsController:_seachResultVc];

    //指定刷新搜素结果的代理
    _searchController.searchResultsUpdater = self;
    //设置
    _searchController.searchBar.frame = CGRectMake(_searchController.searchBar.frame.origin.x, _searchController.searchBar.frame.origin.y, _searchController.searchBar.frame.size.width, 44);
    _tableView.tableHeaderView = _searchController.searchBar;
    
}

#pragma mark -UITableViewDataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%c",(char)('A' + section)];
}


#pragma mark -关于搜索

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchStr = _searchController.searchBar.text;
    [self updateSEarchWithText:searchStr];
    if (_searchController.searchResultsController) {

        MyTableViewController *vc = (MyTableViewController *)_searchController.searchResultsController;
        vc.seachResult = _searchResult;
        [vc.tableView reloadData];
    }
}

-(void)updateSEarchWithText:(NSString *)text
{
    if (_searchResult == nil) {
        _searchResult = [[NSMutableArray alloc]init];
    }
    [_searchResult removeAllObjects];
    if (text == nil) {
        
        [_searchResult addObject:@"没有搜索结果"];
    }else
    {
        for (NSMutableArray *array in _dataArray)
        {
            for (NSString *str in array)
            {
                //搜索条件是str只有包含text子串，符合条件
                if ([str containsString:text]) {
                    
                    [_searchResult addObject:str];
                }
            }
        }
        if (_searchResult.count == 0) {
            
            [_searchResult addObject:@"没有搜索结果"];
        }
    }
}
//搜索控制器将要消失
- (void)willDismissSearchController:(UISearchController *)searchController
{
   
    
    
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
