//
//  ThirdViewController.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ThirdViewController.h"
#import "personCell.h"
#import "Person.h"

@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation ThirdViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"changeColor" object:nil];
   _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [_tableView registerNib:[UINib nibWithNibName:@"personCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:_tableView];
}


-(void)changeColor:(NSNotification *)notify
{
    UIColor *color = notify.object;
    self.view.backgroundColor = color;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"person"];
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:array];
    [_tableView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    personCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    NSData *data = _dataArray[indexPath.row];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    cell.nameLabel.text = p.name;
    cell.ageLabel.text = p.age;
    cell.scoreLabel.text = p.score;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [[NSUserDefaults standardUserDefaults] setObject:_dataArray forKey:@"person"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
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
