//
//  ViewController2.m
//  day08_homeWork
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController2 ()
{
    NSMutableArray *_dataSource;
}
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource  =[[NSMutableArray alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 120, 50, 30)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"姓名";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 180, 50, 30)];
    label2.backgroundColor = [UIColor lightGrayColor];
    label2.text = @"年龄";
    label2.textColor = [UIColor blackColor];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(30, 240, 50, 30)];
    label3.backgroundColor = [UIColor lightGrayColor];
    label3.text = @"成绩";
    label3.textColor = [UIColor blackColor];
    [self.view addSubview:label3];
    
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(120, 120, 200, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.tintColor = [UIColor blackColor];
    textField.tag = 10;
    [self.view addSubview:textField];
    
    UITextField *textField2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 180, 200, 30)];
    textField2.backgroundColor = [UIColor whiteColor];
    textField2.tintColor = [UIColor blackColor];
    textField2.tag = 20;
    [self.view addSubview:textField2];
    
    UITextField *textField3 = [[UITextField alloc]initWithFrame:CGRectMake(120, 240, 200, 30)];
    textField3.backgroundColor = [UIColor whiteColor];
    textField3.tintColor = [UIColor blackColor];
    textField3.tag = 30;
    [self.view addSubview:textField3];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(250, 320, 40, 30)];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor yellowColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [button addTarget:self action:@selector(buttonSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}
-(void)buttonSave{
    
    UITextField *textField  = (id)[self.view viewWithTag:10];
    UITextField *textField2 = (id)[self.view viewWithTag:20];
    UITextField *textField3 = (id)[self.view viewWithTag:30];
    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    _dataSource = [NSMutableArray arrayWithArray:[defauts objectForKey:@"_dataSource"]];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:textField.text];
    [array addObject:textField2.text];
    [array addObject:textField3.text];
    [_dataSource addObject:array];
    [defauts setObject:_dataSource forKey:@"_dataSource"];
    [defauts synchronize];
    
    
    
    
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
