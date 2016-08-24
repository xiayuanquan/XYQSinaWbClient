//
//  Status.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RetweetedWBStatus.h"
#import "WBUser.h"

@interface WBStatus : NSObject

/** 原创微博发布时间 */
@property (copy,nonatomic)NSString *created_at;
/** 原创微博单张配图 */
@property (copy,nonatomic)NSString *thumbnail_pic;
/** 原创微博多张配图 */
@property (strong,nonatomic)NSArray  *pic_urls;
/** 原创微博发布来源 */
@property (copy,nonatomic)NSString *source;
/** 原创微博发布正文 */
@property (copy,nonatomic)NSString *text;
/** 原创微博转发数 */
@property (assign,nonatomic)NSInteger reposts_count;
/** 原创微博评论数 */
@property (assign,nonatomic)NSInteger comments_count;
/** 原创微博表态数 */
@property (assign,nonatomic)NSInteger attitudes_count;

/** 微博用户模型 */
@property (strong,nonatomic)WBUser *user;
/** 转发微博模型 */
@property (strong,nonatomic)RetweetedWBStatus *retweeted_status;

@end
