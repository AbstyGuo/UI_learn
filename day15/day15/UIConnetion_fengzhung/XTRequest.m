//
//  XTRequest.m
//  UIConnetion_fengzhung
//
//  Created by 夏婷 on 15/12/3.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "XTRequest.h"

@implementation XTRequest
{
    NSURLConnection *_connection;//发起连接
    
    NSMutableData *_receiveData;//接收请求数据
    
    NSHTTPURLResponse *_response;//记录服务端返回的响应
    
    void(^_callBack)(NSData *data,NSHTTPURLResponse *response,NSError *error);//记录发起请求时的回调block参数
}
-(void)requestWtihCompleteHandler:(void(^)(NSData * data,NSHTTPURLResponse *response,NSError *error))handler
{
    //把回调的block赋值给_callBack
    _callBack = handler;
    //发起连接请求
    [self startRequest];
}


-(void)startRequest
{
    //创建目标路径对象
    NSURL *URL = [NSURL URLWithString:_url];
    //创建请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:URL];
    //设置缓存机制
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    //设置超时时间
    [request setTimeoutInterval:20];
    
    if (_httpMethod) {
        //设置请求方法
        [request setHTTPMethod:_httpMethod];
    }
    //创建并立即发起连接请求
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
}
//取消连接
-(void)cancelRequest
{
    //取消连接
    [_connection cancel];
}

#pragma mark - 请求过程相关的协议方法
//接收到服务端的响应时调用这个方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSHTTPURLResponse *res = (id)response;
    //记录下服务端返回的响应
    _response = (id)response;
    //判断连接是否成功
    if (res.statusCode == 200) {
        //初始化_receiveData
        _receiveData = [[NSMutableData alloc]init];
    }else
    {
        //如果失败反馈给代理方法
        NSError *error = [[NSError alloc]initWithDomain:res.description code:res.statusCode userInfo:nil];
        //如果采用协议方法回调
        if (_delegate && [_delegate respondsToSelector:@selector(requestFailedWith:)]) {
            
            [_delegate requestFailedWith:error];
        }
        //如果时采用block回调时
        if(_callBack)
        {
            _callBack(_receiveData,_response,error);
        }
    }
    
}
//请求成功，服务端向客户端传输数据时调用这个方法
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //拼接数据
    [_receiveData appendData:data];
}

// 数据传输完毕时调用这个方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
     //采用block回调方式
    if(_delegate && [_delegate respondsToSelector:@selector(requestSuccessWithData:)])
    {
        //将请求到得数据反馈给代理方
        [_delegate requestSuccessWithData:_receiveData];
    }
    //采用block回调方式
    if(_callBack)
    {
        _callBack(_receiveData,_response,nil);
    }
    
}

//连接失败时调用这个方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //采用协议方法
    if (_delegate && [_delegate respondsToSelector:@selector(requestFailedWith:)]) {
        //将连接失败的信息反馈给代理方
        [_delegate requestFailedWith:error];
    }
    
    //采用block回调方式
    if (_callBack) {
        
        _callBack(_receiveData,_response,error);
    }
    
}









@end
