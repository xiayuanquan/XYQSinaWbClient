//
//  WBStatusFrame.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WBStatusFrame.h"
#import "WBStatus.h"

@implementation WBStatusFrame


//设置微博模型
-(void)setWbStatus:(WBStatus *)wbStatus{
    _wbStatus = wbStatus;
    
/*************************************TopView************************************************************/
/*************************************TopView************************************************************/
  
    //标记TopView吃的高度
    CGFloat TopViewHeight = 0;
    
    /** 1.微博用户图像Frame */
    _userIconViewFrame = CGRectMake(CellBorder, CellBorder, userIconWidth, userIconWidth);
    
    /** 2.微博用户昵称Frame */
    CGSize size = [wbStatus.user.name sizeWithAttributes:@{NSFontAttributeName:userNameFont}];
    _userNameLabelFrame = CGRectMake(CGRectGetMaxX(_userIconViewFrame)+NeighViewGap, CellBorder, size.width, size.height);
    
    /** 3.微博用户会员Frame */
    _mbrankViewFrame = CGRectMake(CGRectGetMaxX(_userNameLabelFrame)+NeighViewGap*0.5, CellBorder, size.height, size.height);
    
    /** 4.微博发布时间Frame */
    size = [wbStatus.created_at sizeWithAttributes:@{NSFontAttributeName:timeTextFont}];
    _timeLabelFrame = CGRectMake(CGRectGetMaxX(_userIconViewFrame)+NeighViewGap, CGRectGetMaxY(_userNameLabelFrame)+NeighViewGap, size.width, size.height);
    
    /** 5.微博来源Frame */
    size = [wbStatus.source sizeWithAttributes:@{NSFontAttributeName:sourceTextFont}];
    _sourceLabelFrame = CGRectMake(CGRectGetMaxX(_timeLabelFrame)+NeighViewGap, CGRectGetMaxY(_userNameLabelFrame)+NeighViewGap, size.width, size.height);
    
    /** 6.原创微博正文Frame */
    if (wbStatus.text) {
        CGRect rect = [wbStatus.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-2*CellBorder, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:contentTextFont} context:nil];
        _contentLabelFrame = CGRectMake(CellBorder, CGRectGetMaxY(_userIconViewFrame)+NeighViewGap, rect.size.width,rect.size.height);
        
        TopViewHeight = CGRectGetMaxY(_contentLabelFrame)+CellBorder;
    }
    
    /** 7.原创微博单张配图Frame */
    NSInteger count = wbStatus.pic_urls.count;
    if (count == 1) {
        //取出图片的尺寸
        NSURL *URL = [NSURL URLWithString:[wbStatus.pic_urls firstObject][@"thumbnail_pic"]];
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
        _originalPhotoFrame = CGRectMake(CellBorder, CGRectGetMaxY(_contentLabelFrame)+NeighViewGap, img.size.width, img.size.height);
        
        TopViewHeight = CGRectGetMaxY(_originalPhotoFrame);
    }
    
    /** 8.原创微博多张配图Frame */
    NSInteger row = 0;//行数
    if(count > 1){
        
        if (count <=3)
        {
            row = 1;
        }else if(count <= 6){
            row = 2;
        }else{
            row = 3;
        }
        _originalPhotosFrame = CGRectMake(CellBorder, CGRectGetMaxY(_contentLabelFrame)+NeighViewGap, SCREEN_WIDTH, (PhotoWidth+NeighViewGap)*row-NeighViewGap);
        
        TopViewHeight = CGRectGetMaxY(_originalPhotosFrame);
    }
    
    
    /** 9.原创微博TopView的Frame,存放所有的原创微博的子控件 */
    _TopViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, TopViewHeight);
  
    
/*************************************MidView************************************************************/
/*************************************MidView************************************************************/
    
    //标记MidView的高度
    CGFloat midViewHeight = 0;
    
    /** 10.转发微博正文Frame */
    if (wbStatus.retweeted_status) {
        NSString *allTexts = [NSString stringWithFormat:@"@%@\n%@",wbStatus.retweeted_status.user.name,wbStatus.retweeted_status.text];
        CGRect rect = [allTexts boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-2*CellBorder, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:contentTextFont} context:nil];
        _retweetedContentLabelFrame = CGRectMake(CellBorder, CellBorder, rect.size.width,rect.size.height);
        
        midViewHeight = CGRectGetMaxY(_retweetedContentLabelFrame)+CellBorder;
    }
    
    
    /** 11.转发微博单张配图Frame */
    count = wbStatus.retweeted_status.pic_urls.count;
    if (count == 1) {
        
        //取出图片的尺寸
        NSURL *URL = [NSURL URLWithString:[wbStatus.retweeted_status.pic_urls firstObject][@"thumbnail_pic"]];
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
        _retweetedPhotoFrame = CGRectMake(CellBorder, CGRectGetMaxY(_retweetedContentLabelFrame)+NeighViewGap, img.size.width, img.size.height);
        
        midViewHeight = CGRectGetMaxY(_retweetedPhotoFrame)+CellBorder;
    }
    
    
    /** 12.转发微博多张配图Frame */
    if(count > 1){
        
        if (count <=3)
        {
            row = 1;
        }else if(count <= 6){
            row = 2;
        }else{
            row = 3;
        }
        _retweetedPhotosFrame = CGRectMake(CellBorder, CGRectGetMaxY(_retweetedContentLabelFrame)+NeighViewGap, SCREEN_WIDTH-2*CellBorder, (PhotoWidth+NeighViewGap)*row-NeighViewGap);

        midViewHeight = CGRectGetMaxY(_retweetedPhotosFrame)+CellBorder;
    }
    
    
    /** 13.转发微博MidView的Frame,存放所有的转发微博的子控件 */
    _MidViewFrame = CGRectMake(CellBorder*0.5, CGRectGetMaxY(_contentLabelFrame)+NeighViewGap, SCREEN_WIDTH-CellBorder, midViewHeight);

    
/*************************************ToolBarView************************************************************/
/*************************************ToolBarView************************************************************/
    
    //标记ToolBarView的高度
    CGFloat ToolBarView = 44;
    CGFloat btnWidth = SCREEN_WIDTH/3;
    
    /** 14.微博转发数Frame */
    _repostsButtonFrame = CGRectMake(0, 0, btnWidth, ToolBarView);
    
    /** 15.微博评论数Frame */
    _commentsButtonFrame = CGRectMake(CGRectGetMaxX(_repostsButtonFrame), 0, btnWidth, ToolBarView);
    
    /** 16.微博表态数Frame */
    _attitudesButtonFrame = CGRectMake(CGRectGetMaxX(_commentsButtonFrame), 0, btnWidth, ToolBarView);
    
    /** 17.水平分割线Frame */
    _HorizionLineFrame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    
    /** 18.第一个竖直分割线Frame */
    _FirstVerituaLineFrame = CGRectMake(CGRectGetMaxX(_repostsButtonFrame), CellBorder/2, 1, ToolBarView-CellBorder);
    
    /** 19.第二个竖直分割线Frame */
    _SecondVerituaLineFrame = CGRectMake(CGRectGetMaxX(_commentsButtonFrame), CellBorder/2, 1, ToolBarView-CellBorder) ;

    /** 20.微博ToolBarView的Frame,存放微博的评论数、转发数 、点赞数 */
    if (wbStatus.retweeted_status) {
        _ToolBarViewFrame = CGRectMake(0, CGRectGetMaxY(_MidViewFrame)+CellBorder, SCREEN_WIDTH, ToolBarView);
    }else{
        _ToolBarViewFrame = CGRectMake(0, CGRectGetMaxY(_TopViewFrame)+CellBorder, SCREEN_WIDTH, ToolBarView);
    }
    
    //21.标记单元格高度
    _CellHeight = TopViewHeight + midViewHeight + ToolBarView + 2*CellBorder;
}

@end
