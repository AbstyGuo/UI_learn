//
//  ViewController3.m
//  day08_homeWork
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "ViewController3.h"
#import "MyCell.h"
@interface ViewController3 ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
}
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource = [[NSMutableArray alloc]init];
   [self createTableView];
}

-(void)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //指定数据源代理
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MyCell";
    //tableView到复用池中查找cell
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //创建新的cell
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
   
    
    [cell refreshViewWith:_dataSource];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *red = [[NSUserDefaults standardUserDefaults]objectForKey:@"red"];
    NSString *green = [[NSUserDefaults standardUserDefaults]objectForKey:@"green"];
    NSString *blue = [[NSUserDefaults standardUserDefaults]objectForKey:@"blue"];
    float r = [red floatValue];
    float g = [green floatValue];
    float b = [blue floatValue];
    self.view.backgroundColor = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
    NSMutableArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"_dataSource"];
    _dataSource = [NSMutableArray arrayWithArray:array];
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出对应组的数据源
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
       
        //删除数据源，保证数据源中的数据和tableView所显示的行数一一对应
        [_dataSource removeObjectAtIndex:indexPath.row];
        NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
        [defauts setObject:_dataSource forKey:@"_dataSource"];
        [defauts synchronize];

        //再tabView中删除行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}
//返回删除按钮文字的标题
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
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
