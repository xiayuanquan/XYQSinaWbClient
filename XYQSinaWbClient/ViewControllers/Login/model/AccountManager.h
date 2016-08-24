//
//  AccountManager.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;
@interface AccountManager : NSObject

@property(strong,nonatomic) Account *currentAccount;

//创建一个单例对象：管理者,用来用户的账户信息
+(instancetype)sharedAccountManager;

//当前账户是否有效
-(BOOL)isValidate;

//从文件中取出当前账户
-(Account *)getAccountFromArchiveFile;

//将当前账户保存到文件中
-(void)saveAccountToArchiveFile:(Account *)account;

@end
