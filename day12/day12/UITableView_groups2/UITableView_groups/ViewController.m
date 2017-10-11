//
//  ViewController.m
//  UITableView_groups
//
//  Created by 夏婷 on 15/11/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "MyHeaderFooterView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>//遵循协议
{
    NSMutableArray *_dataSource;// 数据源数组，存放四组图片的数组
    
    NSMutableArray *_showArray;// 管理每一组的显示或隐藏状态
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self readDataSource];
    
    [self createTabelView];
    //设置导航按钮
    [self navigationItemSetting];
    
    
}
#pragma mark -设置导航按钮
-(void)navigationItemSetting
{
    //创建编辑item
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editTableView:)];
    
    self.navigationItem.rightBarButtonItem = editItem;
    
    UIBarButtonItem *mutiEdit = [[UIBarButtonItem alloc]initWithTitle:@"多选删除" style:UIBarButtonItemStyleDone target:self action:@selector(mutiEditTableView:)];

    self.navigationItem.leftBarButtonItems = @[mutiEdit];
}
//点击多选删除时调用的方法
-(void)mutiEditTableView:(UIBarButtonItem *)item
{
    UITableView *tableView = (id)[self.view viewWithTag:100];
    //声明一个删除Item,执行批量删除
    static UIBarButtonItem *deleteItem = nil;
    if([item.title isEqualToString:@"多选删除"])
    {
        item.title = @"完成";
        //编辑时允许多选
        tableView.allowsMultipleSelectionDuringEditing = YES;
        //进入编辑模式
        tableView.editing = YES;
        if(deleteItem == nil)
        {
            // 创建删除导航按钮
            deleteItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(deleteSeletedRows:)];
        }
        self.navigationItem.leftBarButtonItems = @[item,deleteItem];
    }else
    {
        item.title = @"多选删除";
        //设置为非编辑模式
        tableView.editing = NO;
        // 编辑时不允许多选
        tableView.allowsMultipleSelectionDuringEditing = NO;
        /*
         allowsMultipleSelectionDuringEditing  编辑时是否可多选
         allowsSelectionDuringEditing 编辑是是否可以单选
         allowsSelection 非编辑时，是否可以单选
         allowsMultipleSelection 非编辑是是否可以所选
         */
        self.navigationItem.leftBarButtonItems = @[item];
    }
    //刷新所有的cell
    [tableView reloadData];
}
//执行批量删除
-(void)deleteSeletedRows:(UIBarButtonItem *)item
{
   //取出tableView
    UITableView *tableView = (id)[self.view viewWithTag:100];
    //取出所有选中的行的位置
    NSArray *allRows = [tableView indexPathsForSelectedRows];
    
    
    NSArray *sortArray = [allRows sortedArrayUsingSelector:@selector(compare:)];
    //遍历数组中的indexPath
    for (NSInteger i = sortArray.count -1; i >=0; i--)
    {
        NSIndexPath *indexPath = sortArray[i];
       //取出删除行所在组的数据源
        NSMutableArray *sectionArray = [_dataSource objectAtIndex:indexPath.section];
        //删除删除行对应的图片字典
        [sectionArray removeObjectAtIndex:indexPath.row];
        //tableView删除行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
}
//点击编辑按钮时调用的方法
-(void)editTableView:(UIBarButtonItem *)item
{
    //找到tableView
    UITableView *tableView = (id)[self.view viewWithTag:100];
    
    if([item.title isEqualToString:@"编辑"])
    {
        item.title = @"完成";
        //设置tableView进入编辑模式
        tableView.editing = YES;
        //设置编辑时不允许多选
        tableView.allowsMultipleSelectionDuringEditing = NO;
    }else
    {
        item.title = @"编辑";
        //设置tableView不可编辑
        tableView.editing = NO;
    }
    //刷新所有cell
//    [tableView reloadData];
    //刷新显示的cell
    //1获取所有显示的行
    NSArray *visible = [tableView indexPathsForVisibleRows];
    //执行刷新操作
    [tableView reloadRowsAtIndexPaths:visible withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - 创建UITableView
-(void)createTabelView
{
    //创建TableView并指定风格 ：分组风格
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //tableView用复用ID ：@"footer"注册 尾视图
    [tableView registerClass:[MyHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"footer"];
    //设置tag
    tableView.tag = 100;
    
    //指定数据源代理
    tableView.dataSource = self;
    //指定代理
    tableView.delegate = self;
    
    //设置行高, 通过属性设置的行高,每一行都这么高
    tableView.rowHeight = 80;
    //设置组头视图高度
    tableView.sectionHeaderHeight = 60;
    //自动留出bar 视图的位置
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:tableView];
    
    //创建tableView的头视图
    UILabel *headerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 150)];
    //设置背景颜色
    headerView.backgroundColor = [UIColor orangeColor];
    headerView.text = @"我是tableView头视图";
    //设置字体
    headerView.font = [UIFont boldSystemFontOfSize:80];
    //设置文字颜色
    headerView.textColor = [UIColor blackColor];
    //字体大小自适应宽度
    headerView.adjustsFontSizeToFitWidth = YES;
    //设置tableView的头视图
//    [tableView setTableHeaderView:headerView];
    tableView.tableHeaderView = headerView;
    
    //创建tableView的尾视图
    
    UILabel * footerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 80)];
    //设置背景颜色
    footerView.backgroundColor = [UIColor cyanColor];
    footerView.text = @"头视图，你丑你在前面^.^";
    //设置字体
    footerView.font = [UIFont boldSystemFontOfSize:80];
    //设置文字颜色
    footerView.textColor = [UIColor whiteColor];
    //字体适应宽度
    footerView.adjustsFontSizeToFitWidth = YES;
    //设置对齐方式
    footerView.textAlignment = NSTextAlignmentCenter;
    //设置tableView尾视图
    tableView.tableFooterView = footerView;
    
    // 设置分割线的风格
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    /*
     UITableViewCellSeparatorStyleNone 无
     UITableViewCellSeparatorStyleSingleLine 单条线
     UITableViewCellSeparatorStyleSingleLineEtched 
     一条看不到的线
     */
    
    //设置分割线的边距,上、左、下、右
    tableView.separatorInset = UIEdgeInsetsMake(0, 120, 0, 50);
    // 设置分割线颜色
    tableView.separatorColor = [UIColor purpleColor];
    //设置分割线的模糊效果
    tableView.separatorEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    /*
     UIBlurEffectStyleDark 深度模糊
     UIBlurEffectStyleExtraLight 较浅的模糊
     UIBlurEffectStyleLight 浅模糊
     */
    
    //关于索引的属性
    //设置索引文字的颜色
    tableView.sectionIndexColor = [UIColor redColor];
    
    //设置索引视图的背景颜色
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    //设置拖拽是索引视图的背景颜色
    tableView.sectionIndexTrackingBackgroundColor = [UIColor cyanColor];
    
    //设置不同状态下得可选情况
    tableView.allowsSelection = YES;
    //非编辑模式时允许多选
//    tableView.allowsMultipleSelection = YES;
    //编辑状态允许单选
    tableView.allowsSelectionDuringEditing = YES;
    //编辑状态允许多选
    tableView.allowsMultipleSelectionDuringEditing = YES;
    
}

//读取数据
-(void)readDataSource
{
    //图片信息的plist文件数组
    NSArray *files = @[@"image_圣斗士",@"image_海贼",@"image_火影忍者",@"image_美女"];
    //初始化数据源数组
    _dataSource = [[NSMutableArray alloc]init];
    //初始化管理状态的数组
    _showArray = [[NSMutableArray alloc]init];
    
    for (NSString *fileName in files)
    {
        //获取文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        //管理一组图片数据的数组
        NSMutableArray *sectionArray = [NSMutableArray arrayWithContentsOfFile:path];
        //把管理图片组的数组放到数据源中
        [_dataSource addObject:sectionArray];
        //添加组的显示状态，默认隐藏YES，显示，NO隐藏
        [_showArray addObject:@NO];
    }
    
}

#pragma mark - UITableViewDataSource Methods
//返回要显示的组数，分几组显示数据时，必须要写

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //_dataSource存放着四个数组，每一个数组对应一组图片
    return  [_dataSource count];
}

//返回某一组显示的总行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //section组下标
    NSMutableArray * sectionArray = _dataSource[section ];
    
    //取出显示状态
    BOOL isShow = [[_showArray objectAtIndex:section]boolValue];
    if (isShow == YES) {//显示
        //返回数组中图片的张数
        return sectionArray.count;
    }else
    {
        return 0;
    }
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"imageCell";
    //tableView到复用池中查找是否有可以使用的cell,如果有直接刷新显示数据并用来显示；如果没有，创建新的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //创建新的cell并指定复用ID为@"imageCell"
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        /*
         UITableViewCellStyleDefault
         UITableViewCellStyleSubtitle
         UITableViewCellStyleValue1
         UITableViewCellStyleValue2
         */
        //设置附件视图样式
//        cell.accessoryType = UITableViewCellAccessoryDetailButton;
      /*
       
       UITableViewCellAccessoryNone,无
       UITableViewCellAccessoryDisclosureIndicator, 向右的小箭头
       UITableViewCellAccessoryDetailDisclosureButton, 向右箭头和圆圈带i
       UITableViewCellAccessoryCheckmark, 小对勾
       UITableViewCellAccessoryDetailButton 圆圈带i
       */
        //自定义附件视图
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        button.backgroundColor = [UIColor cyanColor];
        //设置自定义的附件视图
//        cell.accessoryView = button;

    }
    //获取组数据源,indexPath.section组下标
    NSMutableArray *sectionArray = [_dataSource objectAtIndex:indexPath.section];
    //行下标indexPath.row
    NSDictionary *dic = [sectionArray objectAtIndex:indexPath.row];
    //取出图片名字
    NSString *imageName = [dic objectForKey:@"imageName"];
    //获取图片的描述信息
    NSString *imageInfo = [dic objectForKey:@"imageInfo"];
    //设置显示图片
    
//    cell.imageView.image =[UIImage imageNamed:imageName];
    
    //分割图片名字
    NSArray *array = [imageName componentsSeparatedByString:@"."];
    //获取图片路径
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:array[0] ofType:array[1]];
    //读取图片数据
    NSData *imageData = [[NSData alloc]initWithContentsOfFile:imagePath];
    //创建图片对象
    UIImage *image = [[UIImage alloc]initWithData:imageData];
    //设置cell的图片
    cell.imageView.image = image;
    
    
    //设置主标题
    cell.textLabel.text = imageName;
    
    //设置子标题
    cell.detailTextLabel.text = imageInfo;
    
    return cell;
    
}


#pragma mark - 关于组头视图和尾视图的协议方法
//返回组的头视图标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%ld组头视图",section];
}
////返回组的尾视图标题
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"第%ld组尾视图",section];
//}

//返回任意组透视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 80;
//    }
//    return 40;
    return 60;
}
//返回任意组尾视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
//自定义组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //设置头视图的复用ID
    static NSString *headerID = @"header";
    //tableView到复用池中查找是否有空闲的头视图可用，有直接用，没有创建新的头视图
    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (view == nil) {//没有
        //创建新的头视图设置大小
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];
        view.backgroundColor = [UIColor redColor];
        //设置frame
        UILabel *label = [[UILabel alloc]initWithFrame:view.bounds];
        label.textColor = [UIColor whiteColor];
        label.tag = 10;
        //设置字体
        label.font = [UIFont boldSystemFontOfSize:30];
    
        label.adjustsFontSizeToFitWidth = YES;
        //设置对齐方式
        label.textAlignment = NSTextAlignmentCenter;
        //label添加到view
        [view addSubview:label];
    }
    UILabel *label = (id)[view viewWithTag:10];
    label.text = [NSString stringWithFormat:@"第%ld组头视图",section];
    //创建按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    //设置图片
    [button setImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
    //设置tag,由于区分点得时哪一组的按钮
    button.tag = 200 + section;
    //添加点击事件
    [button addTarget:self action:@selector(showOrHiddenSection:) forControlEvents:UIControlEventTouchUpInside];
    BOOL isShow = [[_showArray objectAtIndex:section] boolValue];
    if (isShow == YES) {
        //展开
        button.transform = CGAffineTransformMakeRotation(M_PI_2);//旋转90度
    }else
    {
        //隐藏
        button.transform = CGAffineTransformMakeRotation(0);//旋转90度
    }
    
    [view addSubview:button];
    
    return view;
}
//点击显示或隐藏组按钮时调用的方法
-(void)showOrHiddenSection:(UIButton *)button
{
    BOOL isShow = [[_showArray objectAtIndex:button.tag - 200]boolValue];
    if (isShow == NO) {
        
        // @NO,@NO,@NO,@NO
        //@YES,@NO,@NO,@NO
        NSNumber *show = @YES;
        //显示状态替换隐藏状态
        [_showArray replaceObjectAtIndex:button.tag - 200 withObject:show];
    }else
    {
        NSNumber *show = @NO;
        [_showArray replaceObjectAtIndex:button.tag - 200 withObject:show];
    }
    
    UITableView *tableView = (id)[self.view viewWithTag:100];
    //刷新这一组所有的cell
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 200] withRowAnimation:UITableViewRowAnimationNone];
    
}

//自定义尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    static NSString *footerID = @"footer";
    //tableView到复用池中去查找，如果有可以复用尾视图，直接使用，没有就创建
    MyHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerID];
    
    if (footer == nil) {
        //创建新的尾视图
        footer = [[MyHeaderFooterView alloc]initWithReuseIdentifier:footerID];
        footer.backgroundView = nil;
        
    }
    
    footer.Label.text = [NSString stringWithFormat:@"第%ld组尾视图",section];
    return footer;
}

#pragma mark - 关于索引的协议方法
//返回索引的标题数组数组，
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"圣",@"海",@"火",@"女"];
}
//点击索引标题时，返回期望跳转的组的下标
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
//    return _dataSource.count - 1 -index;
    //通常都是跳转到对应的组
    return index;
}

#pragma mark -关于编辑的协议方法 
//返回某一行是否允许编辑，YES允许，NO不允许
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//返回某一行具体的编辑模式：增加、删除、无
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.editing == YES)
    {
        if(indexPath.row % 2 == 0)
        {
            return UITableViewCellEditingStyleInsert;//  增加
        }else
        {
            return UITableViewCellEditingStyleDelete;
        }
    }else
    {
        //左滑动出现删除按钮，非编辑状态时
        return UITableViewCellEditingStyleDelete;
    }
}
//提交具体的编辑操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出对应组的数据源
    NSMutableArray *sectionArray = [_dataSource objectAtIndex:indexPath.section];
    
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        //删除数据源，保证数据源中得数据和tableView所显示的行一一对应
        [sectionArray removeObjectAtIndex:indexPath.row];
        //在tableView中删除对应的行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }else
    {
        //增加数据源
        NSDictionary *imageDic = @{@"imageName":@"海贼06.jpg",@"imageInfo":@"海贼王06"};
        //在对应的组的数据源中增加图片信息
        [sectionArray insertObject:imageDic atIndex:indexPath.row];
        //增加行
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}
//返回删除按钮的标题
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark - 关于移动的协议方法
//返回任意一行是否允许移动，YES允许，NO不允许移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//移动某一行时调用这个函数，sourceIndexPath移动行的起始位置，destinationIndexPath目标位置
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    //处理数据源
    //取出起始位置的数据源
    NSMutableArray *sourceSection = [_dataSource objectAtIndex:sourceIndexPath.section];
    //取出目标位置对应的数据源数组
    NSMutableArray *desSection = [_dataSource objectAtIndex:destinationIndexPath.section];
    if (sourceIndexPath.section == destinationIndexPath.section)
    {
        //在组内移动
        
        //取出对应的图片字典
        NSDictionary *imageDic = [sourceSection objectAtIndex:sourceIndexPath.row];
        if(sourceIndexPath.row > destinationIndexPath.row)
        {
            //从后往前移动
            //0123456……
            //40123456
            //插入目标位置
            [sourceSection insertObject:imageDic atIndex:destinationIndexPath.row];
            //删除原起始位置的字典
            [sourceSection removeObjectAtIndex:sourceIndexPath.row + 1];
        }else
        {
            //从前往后移动
            //0123456……
            //01230456……
            //把移动的行对应的数据插入到目标位置
            [sourceSection insertObject:imageDic atIndex:destinationIndexPath.row];
            //删除起始位置的图片字典
            
            [sourceSection removeObjectAtIndex:sourceIndexPath.row];
        }
    }else
    {
        //夸组移动
        //取出移动行对应的字典
        NSDictionary *imageDic = [sourceSection objectAtIndex:sourceIndexPath.row];
        
        //添加到目标位置对应的数据源数组中
        [desSection  insertObject:imageDic atIndex:destinationIndexPath.row];
        //删除原位置的图片对应的字典
        [sourceSection removeObjectAtIndex:sourceIndexPath.row];
    }
}
//返回某一行指定的移动目标位置
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section == 0 && sourceIndexPath.row == 0) {
        
        return [NSIndexPath indexPathForRow:3 inSection:0];
    }
    //返回预估目标位置
    return proposedDestinationIndexPath;
}

#pragma mark - UITableViewDelegate Methods
//选中某一行时调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *svc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    //第一个参数：xib文件的名字
    //第二参数：nil 相当于[NSBundle mainBundle]
    
    //取到选中行对应的数据源数组
    NSMutableArray *sectionArray = [_dataSource objectAtIndex:indexPath.section];
    //取到图片对应的字典
    NSDictionary *dict = [sectionArray objectAtIndex:indexPath.row];
    //取出图片名字
    NSString *imageName = [dict objectForKey:@"imageName"];
    
    //显示到svc的imageView上
    svc.imageView.image = [UIImage imageNamed:imageName];
    
    svc.imageName = imageName;
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
