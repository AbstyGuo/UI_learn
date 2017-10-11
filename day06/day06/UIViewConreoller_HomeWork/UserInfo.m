//
//  UserInfo.m
//  UIViewConreoller_HomeWork
//
//  Created by 夏婷 on 15/11/23.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
       
        _userName = [aDecoder decodeObjectForKey:@"userName"];
        _password = [aDecoder decodeObjectForKey:@"password"];
        _email = [aDecoder decodeObjectForKey:@"email"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:_email forKey:@"email"];
}

@end
