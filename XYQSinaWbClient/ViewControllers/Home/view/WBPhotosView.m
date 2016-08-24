//
//  WBPhotosView.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WBPhotosView.h"

@implementation WBPhotosView

//原创微博
-(void)setStatus:(WBStatus *)status{
    
    _status = status;
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = PhotoWidth;
    CGFloat imageH = PhotoWidth;
    NSInteger maxCol = 3;
    NSInteger count = status.pic_urls.count;;
    
    //遍历多图,创建UIImageView
    for (int i = 0; i<count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        
        //是否换行
        if (i!=0 && i%maxCol == 0) {
            
            imageX = 0;
            imageY += (imageH+NeighViewGap);
        }
        
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageX += (imageW+NeighViewGap);
        
        //设置图片
        NSURL *URL = [NSURL URLWithString:[status.pic_urls[i] objectForKey:@"thumbnail_pic"]];
        [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }
}

//转发微博
-(void)setRetweetedStatus:(RetweetedWBStatus *)retweetedStatus{
    
    _retweetedStatus = retweetedStatus;
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = PhotoWidth;
    CGFloat imageH = PhotoWidth;
    NSInteger maxCol = 3;
    NSInteger count = retweetedStatus.pic_urls.count;;
    
    //遍历多图,创建UIImageView
    for (int i = 0; i<count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        
        //是否换行
        if (i!=0 && i%maxCol == 0) {
            
            imageX = 0;
            imageY += (imageH+NeighViewGap);
        }
        
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageX += (imageW+NeighViewGap);
        
        //设置图片
        NSURL *URL = [NSURL URLWithString:[retweetedStatus.pic_urls[i] objectForKey:@"thumbnail_pic"]];
        [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }
}
@end
