//
//  ViewController.m
//  UITableView_groups
//
//  Created by MS on 15-11-28.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>//遵循协议
{
    NSMutableArray * _dataSource;//数据源数组，存放四组图片的数组
    NSMutableArray * _showArray;//专门管理每一组的显示或隐藏状态
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readDataSource];
    [self createTableView];
    [self navigationItemSetting];//设置导航按钮
}

#pragma mark - 设置导航按钮
-(void)navigationItemSetting
{
    //创建编辑item
    UIBarButtonItem * editItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editTableView:)];
    self.navigationItem.rightBarButtonItem = editItem;
    
    UIBarButtonItem * mutiEdit = [[UIBarButtonItem alloc]initWithTitle:@"多选删除" style:UIBarButtonItemStyleDone target:self action:@selector(mutiEditTableView:)];
    self.navigationItem.leftBarButtonItems = @[mutiEdit];
}
//点击左编辑按钮（多选删除）时调用的方法
-(void)mutiEditTableView:(UIBarButtonItem *)item
{
    //找到tableView
    UITableView * tableView = (id)[self.view viewWithTag:40];
    //声明一个删除Item，执行批量删除
    static UIBarButtonItem * deleteItem = nil;
    
    if ([item.title isEqualToString:@"多选删除"])
    {
        item.title = @"完成";
        tableView.allowsMultipleSelectionDuringEditing = YES;//设置编辑时允许多选
        tableView.editing = YES;
        if (deleteItem == nil) {
            deleteItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(deleteSelectedRows:)];
        }
        self.navigationItem.leftBarButtonItems = @[item,deleteItem];
    }
    else
    {
        item.title = @"多选删除";
        tableView.editing = NO;//设为非编辑模式
        tableView.allowsMultipleSelectionDuringEditing = NO;//不允许多选
        /*
         allowsSelection                        非编辑时是否可以单选
         allowsSelectionDuringEditing           编辑时是否可以单选
         allowsMultipleSelection                非编辑时是否可以多选
         allowsMultipleSelectionDuringEditing   编辑时是否可以多选
         */
        self.navigationItem.leftBarButtonItems = @[item];
    }
    //刷新所有的cell
    [tableView reloadData];
}
//执行批量删除
-(void)deleteSelectedRows:(UIBarButtonItem *)item
{
    //取出tableView
     UITableView * tableView = (id)[self.view viewWithTag:40];
    //取出所有选中的行的位置
    NSArray * allRows = [tableView indexPathsForSelectedRows];
    NSArray * sortArray = [allRows sortedArrayUsingSelector:@selector(compare:)];
    //遍历数组中的位置
    for (NSInteger i = sortArray.count-1; i>=0; i--)
    {
        NSIndexPath * indexPath = sortArray[i];
        //取出删除行所在的组的数据源
        NSMutableArray * sectionArray = [_dataSource objectAtIndex:indexPath.section];
        //删除删除行对应的图片字典
        [sectionArray removeObjectAtIndex:indexPath.row];
        //tableView删除行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
//    [tableView deleteRowsAtIndexPaths:sortArray withRowAnimation:UITableViewRowAnimationFade];
}

//点击右编辑按钮时调用的方法
-(void)editTableView:(UIBarButtonItem *)item
{
    //找到tableView
    UITableView * tableView = (id)[self.view viewWithTag:40];
    if([item.title isEqualToString:@"编辑"])
    {
        item.title = @"完成";
        //设置tableView进入编辑模式
        tableView.editing = YES;//进入编辑模式
        tableView.allowsMultipleSelectionDuringEditing = NO;//设置编辑时不允许多选
    }
    else
    {
        item.title = @"编辑";
        tableView.editing = NO;//退出编辑模式
    }
    //刷新所有的cell
   // [tableView reloadData];
    
    //刷新所有显示的cell
    //获取所有显示的行
    NSArray * visible = [tableView indexPathsForVisibleRows];
    [tableView reloadRowsAtIndexPaths:visible withRowAnimation:UITableViewRowAnimationBottom];
    
}

#pragma mark - 创建TableView
-(void)createTableView
{
    //创建tableView,并指定风格为分组风格
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.tag = 40;
    //指定代理
    tableView.delegate = self;
    tableView.dataSource = self;
    //设置行高,通过属性设置的行高，每一行都这么高
    tableView.rowHeight = 60;
    //设置组的头视图高度
    tableView.sectionHeaderHeight = 60;
    //设置自适应，让视图自动留出导航条的位置
    self.automaticallyAdjustsScrollViewInsets = YES;
    //添加视图
    [self.view addSubview:tableView];
    
    
    //创建tableView的头视图
    UILabel * HeaderView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 150)];
    HeaderView.backgroundColor = [UIColor orangeColor];
    HeaderView.text = @"我是TableView头视图";
    HeaderView.font = [UIFont boldSystemFontOfSize:80];
    HeaderView.textColor = [UIColor blackColor];
    HeaderView.textAlignment = NSTextAlignmentCenter;
    HeaderView.adjustsFontSizeToFitWidth = YES;
    //设置tableView的头视图
//    [tableView setTableHeaderView:HeaderView];
    tableView.tableHeaderView = HeaderView;
    
    
    //创建tableView的尾视图
    UILabel * footerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 80)];
    footerView.backgroundColor = [UIColor cyanColor];
    footerView.text = @"我是tableView的尾视图，丑的在前，帅的在后";
    footerView.font = [UIFont boldSystemFontOfSize:18];
    footerView.textColor = [UIColor whiteColor];
    footerView.adjustsFontSizeToFitWidth = YES;
    //设置tableView的尾视图
    tableView.tableFooterView = footerView;
    
    
    //设置分割线的风格
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    /*    
     UITableViewCellSeparatorStyleNone,             无分割线
     UITableViewCellSeparatorStyleSingleLine,       单条线（默认的）
     UITableViewCellSeparatorStyleSingleLineEtched  一条看不到的线
     */
    //设置分割线的边距
    tableView.separatorInset = UIEdgeInsetsMake(0, 120, 0, 50);//上左下右；
    //设置分割线颜色
    tableView.separatorColor = [UIColor purpleColor];
    //设置分割线模糊效果
    tableView.separatorEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    /*
     UIBlurEffectStyleExtraLight,   较浅模糊
     UIBlurEffectStyleLight,        轻模糊效果
     UIBlurEffectStyleDark          深度模糊
     */
    
    
    //关于索引的属性
    //设置索引文字颜色
    tableView.sectionIndexColor = [UIColor redColor];//文字颜色
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];//背景颜色
    tableView.sectionIndexTrackingBackgroundColor = [UIColor greenColor];//设置拖拽时索引的背景颜色
    
    
    //设置不同状态下的可选情况
    //非编辑状态
    tableView.allowsSelection = YES;                        //单选
//    tableView.allowsMultipleSelection = YES;                //多选
    //编辑状态
    tableView.allowsSelectionDuringEditing = YES;           //单选
    tableView.allowsMultipleSelectionDuringEditing = YES;   //多选
}

//读取数据
-(void)readDataSource
{
    //图片信息的plist文件数组
    NSArray * files = @[@"image_圣斗士",@"image_海贼",@"image_火影忍者",@"image_美女"];
    //初始化数据源数组
    _showArray = [[NSMutableArray alloc]init];
    _dataSource = [[NSMutableArray alloc]init];
    for (NSString * fileName in files) {
        //获取文件路径
        NSString * path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"plist"];
        //管理一组图片数据的小数组
        NSMutableArray * sectionArray = [NSMutableArray arrayWithContentsOfFile:path];
        //添加组的显示状态，默认隐藏，yes显示，no隐藏
        [_showArray addObject:[NSNumber numberWithBool:NO]];
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
    //取出显示状态
    BOOL isShow = [_showArray[section] boolValue];
    if (isShow==YES) {
        //返回数组中图片的张数
        return sectionArray.count;
    }else{
        return 0;
    }
    
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
        
        
        //设置附件视图样式
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        /*
            UITableViewCellAccessoryNone,                      无
            UITableViewCellAccessoryDisclosureIndicator,       向右的箭头   
            UITableViewCellAccessoryDetailDisclosureButton,    向右的箭头和圆圈i
            UITableViewCellAccessoryCheckmark,                 小对勾
            UITableViewCellAccessoryDetailButton               圆圈i
         */
        
//        //自定义附件视图
//        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//        button.backgroundColor = [UIColor cyanColor];
//        [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
//        //设置自定义附件视图
//        cell.accessoryView = button;
        
    }
    //获取组的数据源indexPath.section组下标
    NSMutableArray * sectionArray = [_dataSource objectAtIndex:indexPath.section];
    //获取组内数据源对应位置indexPath.row行下标
    NSDictionary * dic = [sectionArray objectAtIndex:indexPath.row];
    //取出图片名字
    NSString * imageName = [dic objectForKey:@"imageName"];
    //获取图片描述信息
    NSString * imageInfo = [dic objectForKey:@"imageInfo"];
    
    //两种读取图片的方法
    //1.分割图片名字，通过路径获取图片
    NSArray * array = [imageName componentsSeparatedByString:@"."];
    NSString * path = [[NSBundle mainBundle]pathForResource:array[0] ofType:array[1]];
    NSData * data = [NSData dataWithContentsOfFile:path];
    cell.imageView.image = [UIImage imageWithData:data];
    
    //2.通过图片名获取图片
//    cell.imageView.image = [UIImage imageNamed:imageName];//设置显示图片
    
    
    cell.textLabel.text = imageInfo;//设置主标题
    cell.detailTextLabel.text = imageName;//设置子标题
    
    return cell;
}

#pragma mark 关于组头视图和尾视图的协议方法
//返回组的头视图标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%ld组头视图",section+1];
}
//返回组的尾视图标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%ld组尾视图",section+1];
}
//返回任意组头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if (section==0) {
//        return 80;
//    }else
//        return 40;
    return 60;
}
//返回任意组尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
//自定义组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //设置头视图的复用ID
    static NSString * headerID = @"header";
    //tableView到复用池中查找是否有空闲的头视图可用，有就直接用，没有就创建新的头视图
    UIView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (view==nil) {
        //创建新的头视图，设置大小
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];
        view.backgroundColor = [UIColor redColor];
        UILabel * label = [[UILabel alloc]initWithFrame:view.bounds];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:40];
        label.adjustsFontSizeToFitWidth = YES;
        label.tag = 10;
        //label添加到view
        [view addSubview:label];
    }
    UILabel * label = (id)[view viewWithTag:10];
    label.text = [NSString stringWithFormat:@"第%ld组头视图",section+1];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 30, 30)];
    [button setImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
    button.tag = 200+section;//设置tag用于区分点的是哪组的按钮
    //添加点击事件
    [button addTarget:self action:@selector(showOrHiddenSection:) forControlEvents:UIControlEventTouchUpInside];
    BOOL isShow = [[_showArray objectAtIndex:section] boolValue];
    if (isShow == YES) {
        button.transform = CGAffineTransformMakeRotation(M_PI_2);//旋转90度
    }
    else
    {
        button.transform = CGAffineTransformMakeRotation(0);
    }
    [view addSubview:button];
    return view;
}
//点击显示或隐藏组按钮的方法
-(void)showOrHiddenSection:(UIButton *)button
{
    BOOL isShow = [[_showArray objectAtIndex:button.tag-200] boolValue];
    if (isShow == NO) {
        NSNumber * show = @YES;
        //显示状态替换隐藏状态
        [_showArray replaceObjectAtIndex:button.tag-200 withObject:show];
    }else
    {
        NSNumber * show = @NO;
        [_showArray replaceObjectAtIndex:button.tag-200 withObject:show];
    }
    UITableView * tableView = (id)[self.view viewWithTag:40];
    //刷新这一组所有的cell
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag-200] withRowAnimation:UITableViewRowAnimationBottom];
}

//自定义组的尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    //设置头视图的复用ID
    static NSString * footerID = @"footer";
    //tableView到复用池中查找是否有空闲的尾视图可用，有就直接用，没有就创建新的尾视图
    UIView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerID];
    if (view==nil) {
        //创建新的尾视图，设置大小
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
        view.backgroundColor = [UIColor greenColor];
        UILabel * label = [[UILabel alloc]initWithFrame:view.bounds];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:30];
        label.adjustsFontSizeToFitWidth = YES;
        label.tag = 20;
        //label添加到view
        [view addSubview:label];
    }
    UILabel * label = (id)[view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"第%ld组尾视图",section+1];
    return view;

}

#pragma mark 关于索引的协议方法
//返回索引的标题数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"圣",@"海",@"火",@"女"];
}
//点击索引标题时，返回期望跳转的组的下标
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
   // return _dataSource.count-1-index;
    //通常都是跳转到对应的组
    return index;
}

#pragma mark 关于编辑的协议方法
//返回某一行是否允许编辑，yes允许，no不允许
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//返回某一行具体的编辑模式:增加、删除、无
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     UITableViewCellEditingStyleNone,
     UITableViewCellEditingStyleDelete,
     UITableViewCellEditingStyleInsert
     */
    if (tableView.editing == YES)
    {
        if (indexPath.row%2 == 0)
        {   //返回增加模式
            return UITableViewCellEditingStyleInsert;
        }else
        {   //返回删除模式
            return UITableViewCellEditingStyleDelete;
        }
    }
    else
    {   //左滑出现删除按钮，非编辑状态时
        return UITableViewCellEditingStyleDelete;
    }
}
//提交具体的编辑操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出对应组的数据源
    NSMutableArray * sectionArray = _dataSource[indexPath.section];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除数据源，保证数据源中的数据和tableView所显示的行数一一对应
        [sectionArray removeObjectAtIndex:indexPath.row];
        //在tableView中删除对应的行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    else
    {
        //增加数据源
        NSDictionary * imageDic = @{@"imageName":@"美女18.jpg",@"imageInfo":@"美女18"};
        [sectionArray insertObject:imageDic atIndex:indexPath.row];
        //增加行
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}
//返回删除按钮的标题文字
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark 关于移动的协议方法
//返回任意一行是否允许移动，yes允许no不允许
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//移动某一行时调用这个函数 sourceIndexPath：被移动行的起始位置  destinationIndexPath：目标位置
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //处理数据源
    //取出起始位置对应的数据源
    NSMutableArray * sourceSection = [_dataSource objectAtIndex:sourceIndexPath.section];
    //取出目标位置对应的数据源
    NSMutableArray * desSection = [_dataSource objectAtIndex:destinationIndexPath.section];
     NSDictionary * imageDic = [sourceSection objectAtIndex:sourceIndexPath.row];//取出起始位置对应的数据源
    //判断是否同组移动
    if (sourceIndexPath.section == destinationIndexPath.section) {
        //组内移动  判断组内从后往前还是从前往后
        if (sourceIndexPath.row > destinationIndexPath.row) {
            //从后往前移动  0 1 2 3 4 5 第4移到第1  先插入0 4 1 2 3 4 5再删除
           
            //插入目标位置
            [desSection insertObject:imageDic atIndex:destinationIndexPath.row];
            //删除原起始位置的字典
            [sourceSection removeObjectAtIndex:sourceIndexPath.row+1];
        }
        else//从前往后移动
        {
            //012345 1移到4 0123145 再删除
            //把移动的行对应的数据插入到目标位置
            [sourceSection insertObject:imageDic atIndex:destinationIndexPath.row];
            //删除起始位置的图片字典
            [sourceSection removeObjectAtIndex:sourceIndexPath.row];
        }
    }
    else//跨组移动
    {
        //把数据移动到目标位置
        [desSection insertObject:imageDic atIndex:destinationIndexPath.row];
        //删除原位置的数据
        [sourceSection removeObjectAtIndex:sourceIndexPath.row];
    }
}
//返回某一行，指定的移动目标位置，提前设定好要移动到的位置
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section==0&&sourceIndexPath.row==0) {
        //指定第0组第0行移动的目标位置
        return [NSIndexPath indexPathForRow:3 inSection:0];
    }
    return proposedDestinationIndexPath;//返回预估位置
}

#pragma mark 关于tableView代理的协议方法
//选中某一行时调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController * svc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    //第一个参数是XIB文件的名字   第二个参数写nil相当于 [NSBundle mainBundle]
    
    //取到选中行对应的数据源数组
    NSMutableArray * sectionArray = [_dataSource objectAtIndex:indexPath.section];
    //取到图片对应的字典
    NSDictionary * imageDic = [sectionArray objectAtIndex:indexPath.row];
    //取出图片名字
    NSString * imageName = [imageDic objectForKey:@"imageName"];
    //显示到svc的imageView上
    svc.imageName = imageName;    
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
