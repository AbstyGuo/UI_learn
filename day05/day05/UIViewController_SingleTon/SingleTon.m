//
//  SingleTon.m
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "SingleTon.h"

@implementation SingleTon

//创建单例的方式
/*
+(SingleTon *)shareSingleTon
{
    static SingleTon *single = nil;
    @synchronized(self)//保证线程安全
    {
        if (single == nil) {
            single = [[[SingleTon class] alloc]init];
        }
    }
    return single;
}
 */

/*另一种单例的实现方式，也是保证线程安全的*/

+(SingleTon *)shareSingleTon
{
    static SingleTon *single = nil;
    static dispatch_once_t tonken;
    //保证block中得代码，只被执行一次
    dispatch_once(&tonken, ^{
        
        single = [[SingleTon alloc]init];
    });
    return single;
}


@end
