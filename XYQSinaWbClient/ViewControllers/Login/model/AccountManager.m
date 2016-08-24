//
//  AccountManager.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountManager.h"
#import "Account.h"

@implementation AccountManager

//重写初始化方法
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _currentAccount = [self getAccountFromArchiveFile];
    }
    return self;
}

//当前账户是否有效
-(BOOL)isValidate{
    
    return self.currentAccount != nil;
}

//返回归档文件
-(NSString *)loadFile{
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [document stringByAppendingPathComponent:@"account.dat"];
    
    return fileName;
}

//从文件中取出当前账户
-(Account *)getAccountFromArchiveFile{
    
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:[self loadFile]];
    return account;
}

//将当前账户保存到文件中
-(void)saveAccountToArchiveFile:(Account *)account{
    
    [NSKeyedArchiver archiveRootObject:account toFile:[self loadFile]];
}

//创建一个单例对象：管理者,用来用户的账户信息
+(instancetype)sharedAccountManager
{
    static AccountManager* instance;
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        instance = [[AccountManager alloc]init];
    });
    return instance;
}
@end
