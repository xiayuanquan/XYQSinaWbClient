//
//  RetweetedStatus.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBUser;
@interface RetweetedWBStatus : NSObject

/** 转发微博发布正文 */
@property (copy,nonatomic)NSString *text;
/** 转发微博单张配图 */
@property (copy,nonatomic)NSString *thumbnail_pic;
/** 转发微博多张配图 */
@property (strong,nonatomic)NSArray  *pic_urls;
/** 转发微博用户模型 */
@property (strong,nonatomic)WBUser *user;
@end
