//
//  XTRequest.h
//  UIConnetion_fengzhung
//
//  Created by 夏婷 on 15/12/3.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 把NSURLConnection的请求过程封装到这个类中
 需要设置的参数
 1.目标路径
 2.请求方法（GET、POST、PUT、DELETE、HEAD、OPTIONS、TRANCE）
 
 一
 要提供的方法
 
 1.发起连接
 2.取消连接
 
 回调的方法
 1.请求成功将请求的数据返回给发起请求的对象
 2.连接失败时也应该反馈失败原因给发起请求的对象
 
 
 二、通过block作为参数发起请求，在把连接的结果反馈给发起请求的对象（通过调用block）
 
 */


/*
 *声明协议，约定协议方法
 1.请求成功将请求的数据返回给发起请求的对象
 2.连接失败时也应该反馈失败原因给发起请求的对象
 */
@protocol XTRequestDelegate <NSObject>
//请求成功时调用的方法
-(void)requestSuccessWithData:(NSData *)data;
//请求失败时调用的方法
-(void)requestFailedWith:(NSError *)error;

@end



@interface XTRequest : NSObject<NSURLConnectionDataDelegate>//遵循协议

//提供创建NSURL的目标路径
@property(nonatomic, copy) NSString *url;

//设置请求方法(GET)
@property(nonatomic, copy) NSString *httpMethod;

//代理
@property(nonatomic, assign) id<XTRequestDelegate> delegate;


//发起连接
-(void)startRequest;

//取消连接
-(void)cancelRequest;

//发起请求，采用block反馈请求结果
-(void)requestWtihCompleteHandler:(void(^)(NSData * data,NSHTTPURLResponse *response,NSError *error))handler;



@end
