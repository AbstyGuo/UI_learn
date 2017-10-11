//
//  Person.h
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *score;

@end
