//
//  SingleTon.h
//  UIViewController_delegate
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTon : NSObject
//声明一个属性，用于存储输入的文字
@property (nonatomic,copy) NSString *showText;
//创建单例的方法
+(SingleTon *)shareSingleTon;

@end
