//
//  RootViewController.m
//  Xib_Demo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    IBOutlet UIButton *_button1;
}
@property (weak, nonatomic) IBOutlet UILabel *myLabel;


@end

@implementation RootViewController

- (IBAction)buttonClicked:(id)sender
{
    static int count = 0;
    _myLabel.text = [NSString stringWithFormat:@"点击%d次",++count];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
