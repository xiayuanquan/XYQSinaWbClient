//
//  User.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject

/** 用户ID */
@property (copy,nonatomic)NSString *idstr;
/** 用户昵称 */
@property (copy,nonatomic)NSString *name;
/** 用户图像 */
@property (copy,nonatomic)NSString *avatar_large;
/** 用户会员等级 */
@property (assign,nonatomic)int  mbrank;
/** 用户会员类型 */
@property (assign,nonatomic)int  mbtype;

@end
