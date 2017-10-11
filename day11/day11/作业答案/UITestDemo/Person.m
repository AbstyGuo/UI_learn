//
//  Person.m
//  UITestDemo
//
//  Created by 夏婷 on 15/10/10.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeObjectForKey:@"age"];
        _score = [aDecoder decodeObjectForKey:@"score"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_age forKey:@"age"];
    [aCoder encodeObject:_score forKey:@"score"];
}
@end
