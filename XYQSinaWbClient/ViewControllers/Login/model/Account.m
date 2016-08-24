//
//  Account.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Account.h"

@implementation Account
//初始化
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _access_token = [dic[@"access_token"] copy];
        _expires_in = [dic[@"expires_in"] longLongValue];
        _remind_in = [dic[@"remind_in"] longLongValue];
        _uid = [dic[@"uid"] longLongValue];
        _created_date = [NSDate date];
    }
    return self;
}

//判断账号是否超期
-(BOOL)isExpired{
    
    NSDate *expiredDate = [_created_date dateByAddingTimeInterval:_expires_in];
    NSDate *now = [NSDate date];
    if([now compare:expiredDate]== NSOrderedDescending)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


#pragma mark - NSCoding协议
#pragma mark 解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [[aDecoder decodeObjectForKey:@"expires_in"] longLongValue];
        _remind_in = [[aDecoder decodeObjectForKey:@"remind_in"] longLongValue];
        _uid = [[aDecoder decodeObjectForKey:@"uid"] longLongValue];
        _created_date = [aDecoder decodeObjectForKey:@"created_date"];
    }
    return self;
}

#pragma mark 归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:@(_expires_in)forKey:@"expires_in"];
    [aCoder encodeObject:@(_remind_in) forKey:@"remind_in"];
    [aCoder encodeObject:@(_uid) forKey:@"uid"];
    [aCoder encodeObject:_created_date forKey:@"created_date"];
}
@end
