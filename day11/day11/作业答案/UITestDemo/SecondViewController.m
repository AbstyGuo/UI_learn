//
//  SecondViewController1.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"changeColor" object:nil];
 
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)changeColor:(NSNotification *)notify
{
    UIColor *color = notify.object;
    self.view.backgroundColor = color;
}
- (IBAction)buttonClicked:(id)sender {
    
    NSArray *array  = [[NSUserDefaults standardUserDefaults]objectForKey:@"person"];
    NSMutableArray *newArray = [[NSMutableArray alloc]initWithArray:array];
    if (_nameText.text.length> 0 && _ageText.text.length > 0 && _scoreText.text.length >0) {
        Person *p = [[Person alloc]init];
        p.name = _nameText.text;
        p.age = _ageText.text;
        p.score = _scoreText.text;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
        [newArray addObject:data];
        [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"person"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_nameText resignFirstResponder];
    [_ageText resignFirstResponder];
    [_scoreText resignFirstResponder];
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
