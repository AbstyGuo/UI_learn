//
//  ViewController.m
//  UIConnetion_fengzhung
//
//  Created by 夏婷 on 15/12/3.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

#import "XTRequest.h"

@interface ViewController ()<XTRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
    [self loadImageData];
    
    
}

#pragma mark - 采用block回调方式，加载图片数据
-(void)loadImageData
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:imageView];
    
    XTRequest *request = [[XTRequest alloc]init];
    //设置url
    request.url = @"http://xiating.local/share_iOS/test.png";
    
    [request requestWtihCompleteHandler:^(NSData *data, NSHTTPURLResponse *response, NSError *error) {
        //判断连接是否成功，200成功
        if (response.statusCode == 200) {
            //判断是否有数据
            if (data.length >0) {
                imageView.image = [[UIImage alloc]initWithData:data];
            }
        }
    }];
}


-(void)loadData
{
    XTRequest *request = [[XTRequest alloc]init];
    //设置url
    request.url = @"http://xiating.local/share_iOS/test.json";
    //设置请求方法
    request.httpMethod = @"GET";
    //设置代理
    request.delegate = self;
    //发起连接请求
    [request startRequest];
    //取消连接
//    [request cancelRequest];
}

#pragma mark-  协议方法

//请求成功
-(void)requestSuccessWithData:(NSData *)data
{
  //解析刷新
    NSString *responStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"请求结果：%@",responStr);
}
//请求失败
-(void)requestFailedWith:(NSError *)error
{
    NSLog(@"请求失败");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
