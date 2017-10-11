//
//  UserInfo.h
//  UIViewConreoller_HomeWork
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>

//用户名
@property (nonatomic, copy) NSString *userName;
//密码
@property (nonatomic, copy) NSString *password;
//邮箱
@property (nonatomic, copy) NSString *email;


@end
