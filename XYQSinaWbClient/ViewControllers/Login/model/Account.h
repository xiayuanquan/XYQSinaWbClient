//
//  Account.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

/*

 2016-01-29 18:25:27.944 CYLTabBarController[6648:399730] {
 "access_token" = "2.00HMevMDjoPWRBc1b0d128a3DxHy8D";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 2939453735;
 }

 
*/
#import <Foundation/Foundation.h>

@interface Account : NSObject<NSCoding>
@property (copy,nonatomic)NSString *access_token;
@property (assign,nonatomic)long long expires_in;
@property (assign,nonatomic)long long remind_in;
@property (assign,nonatomic)long long uid;
@property (strong,nonatomic)NSDate *created_date;

//初始化
-(instancetype)initWithDic:(NSDictionary *)dic;

//判断账号是否超期
-(BOOL)isExpired;

@end
