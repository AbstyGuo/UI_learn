//
//  ViewController4.m
//  day08_homeWork
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()<UIScrollViewDelegate>
{
    NSInteger _countForg;
    NSInteger _countChick;
}
@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    [self createScrollView];
    [self createScrollView1];
    [self createScrollView2];
    
    
}
-(void)createScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 100)];
    scrollView.delegate = self;
    scrollView.tag = 10;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    for (int i=0; i<5; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*scrollView.frame.size.width,0,scrollView.frame.size.width, scrollView.frame.size.height)];
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:25];
        label.text = [NSString stringWithFormat:@"%d只青蛙",i];
        [scrollView addSubview:label];
    }
    scrollView.contentSize = CGSizeMake(5*scrollView.frame.size.width, scrollView.frame.size.height);
}
-(void)createScrollView1{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 100)];
    scrollView.delegate = self;
    scrollView.tag = 20;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    for (int i=0; i<5; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*scrollView.frame.size.width,0,scrollView.frame.size.width, scrollView.frame.size.height)];
        label.backgroundColor = [UIColor cyanColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:25];
        label.text = [NSString stringWithFormat:@"%d只鸡",i];
        [scrollView addSubview:label];
    }
    scrollView.contentSize = CGSizeMake(5*scrollView.frame.size.width, scrollView.frame.size.height);
}
-(void)createScrollView2{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 280, self.view.frame.size.width, 100)];
    scrollView.delegate = self;
    scrollView.tag = 30;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,0,scrollView.frame.size.width, scrollView.frame.size.height)];
    label.backgroundColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:25];
    label.text = [NSString stringWithFormat:@"一共有%lu条腿",_countForg+_countChick];
    [scrollView addSubview:label];
scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height);

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger count = scrollView.tag;
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;

    if (count == 10) {
        _countForg =index * 4;
    }
    else{
        _countChick=index * 2;
    }
    NSLog(@"%ld",count);
    NSLog(@"%ld",_countChick);
    NSLog(@"%ld",_countForg);
    [self createScrollView2];
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
