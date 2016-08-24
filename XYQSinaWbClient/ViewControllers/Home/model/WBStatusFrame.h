//
//  WBStatusFrame.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBStatus;
@interface WBStatusFrame : NSObject

/** 微博模型 */
@property (strong,nonatomic)WBStatus *wbStatus;


#pragma mark 子控件父视图Frame
/** 原创微博TopView的Frame,存放所有的原创微博的子控件 */
@property (assign,nonatomic,readonly)CGRect  TopViewFrame;
/** 转发微博MidView的Frame,存放所有的转发微博的子控件 */
@property (assign,nonatomic,readonly)CGRect  MidViewFrame;
/** 微博ToolBarView的Frame,存放微博的评论数、转发数 、点赞数 */
@property (assign,nonatomic,readonly)CGRect  ToolBarViewFrame;


#pragma mark 用户Frame
/** 微博用户图像Frame */
@property (assign,nonatomic,readonly)CGRect  userIconViewFrame;
/** 微博用户昵称Frame */
@property (assign,nonatomic,readonly)CGRect  userNameLabelFrame;
/** 用户会员等级 */
@property (assign,nonatomic,readonly)CGRect  mbrankViewFrame;


#pragma mark 原创微博Frame
/** 微博发布时间Frame */
@property (assign,nonatomic,readonly)CGRect  timeLabelFrame;
/** 微博来源Frame */
@property (assign,nonatomic,readonly)CGRect  sourceLabelFrame;
/** 微博正文Frame */
@property (assign,nonatomic,readonly)CGRect  contentLabelFrame;
/** 微博缩略图Frame */
@property (assign,nonatomic,readonly)CGRect  originalPhotoFrame;
/** 微博多张图片Frame */
@property (assign,nonatomic,readonly)CGRect  originalPhotosFrame;
/** 微博转发数Frame */
@property (assign,nonatomic,readonly)CGRect  repostsButtonFrame;
/** 微博评论数Frame */
@property (assign,nonatomic,readonly)CGRect  commentsButtonFrame;
/** 微博表态数Frame */
@property (assign,nonatomic,readonly)CGRect  attitudesButtonFrame;


#pragma mark 分割线
/** 水平分割线Frame */
@property (assign,nonatomic,readonly)CGRect  HorizionLineFrame;
/** 第一个竖直分割线Frame */
@property (assign,nonatomic,readonly)CGRect  FirstVerituaLineFrame;
/** 第二个竖直分割线Frame */
@property (assign,nonatomic,readonly)CGRect  SecondVerituaLineFrame;


#pragma mark 转发微博Frame
/** 转发微博正文Frame */
@property (assign,nonatomic,readonly)CGRect  retweetedContentLabelFrame;
/** 转发微博缩略图Frame */
@property (assign,nonatomic,readonly)CGRect  retweetedPhotoFrame;
/** 转发微博多张图片Frame */
@property (assign,nonatomic,readonly)CGRect  retweetedPhotosFrame;


#pragma mark 设置单元格的高度
/** 设置单元格的高度 */
@property (assign,nonatomic,readonly)CGFloat CellHeight;


@end
