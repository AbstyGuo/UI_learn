//
//  ViewController.m
//  storyboard_Demo
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numTouch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tapedView:(id)sender {
    static int i = 0;
    self.numTouch.text = [NSString stringWithFormat:@"点击手势触发%d次",++i];
}

//当要执行一个Segue跳转时，会调用这个方法 storyboard的线叫一个segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //通过segue.identifier来区分跳转  segue.identifier是segue的唯一标识，用来判断是否时要传值的跳转
    if ([segue.identifier isEqualToString:@"segue1"]) {
        //取出跳转的目标视图控制器
        SecondViewController * svc = segue.destinationViewController;
        svc.title = self.numTouch.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
