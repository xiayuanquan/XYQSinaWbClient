//
//  HomeCell.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeCell.h"
#import "WBStatus.h"
#import "WBStatusFrame.h"
#import "WBUser.h"
#import "WBPhotosView.h"
#import "UIImage+Category.h"

@interface HomeCell()

/** 原创微博TopView的Frame,存放所有的原创微博的子控件 */
@property (strong,nonatomic)UIImageView  *TopView;
/** 转发微博MidView的Frame,存放所有的转发微博的子控件 */
@property (strong,nonatomic)UIImageView  *MidView;
/** 微博ToolBarView的Frame,存放微博的评论数、转发数 、点赞数 */
@property (strong,nonatomic)UIImageView  *ToolBarView;

/** 微博用户图像 */
@property (strong,nonatomic)UIImageView *userIconView;
/** 微博用户昵称 */
@property (strong,nonatomic)UILabel *userNameLabel;
/** 用户会员等级 */
@property (strong,nonatomic)UIImageView  *mbrankView;
/** 微博发布时间 */
@property (strong,nonatomic)UILabel *timeLabel;
/** 微博来源 */
@property (strong,nonatomic)UILabel *sourceLabel;


/** 原创微博正文 */
@property (strong,nonatomic)UILabel *contentLabel;
/** 原创微博单张配图 */
@property (strong,nonatomic)UIImageView *originalPhotoView;
/** 原创微博多张配图 */
@property (strong,nonatomic)WBPhotosView *originalPhotosView;

/** 转发微博正文 */
@property (strong,nonatomic)UILabel *retweetedContentLabel;
/** 转发微博单张配图 */
@property (strong,nonatomic)UIImageView *retweetedPhotoView;
/** 转发微博多张配图 */
@property (strong,nonatomic)WBPhotosView *retweetedPhotosView;


/** 微博转发数 */
@property (strong,nonatomic)UIButton *repostsButton;
/** 微博评论数 */
@property (strong,nonatomic)UIButton  *commentsButton;
/** 微博表态数 */
@property (strong,nonatomic)UIButton  *attitudesButton;


/** 水平分割线 */
@property (strong,nonatomic)UIImageView *HorizionLine;
/** 第一个竖直分割线 */
@property (strong,nonatomic)UIImageView  *FirstVerituaLine;
/** 第二个竖直分割线 */
@property (strong,nonatomic)UIImageView  *SecondVerituaLine;

@end

@implementation HomeCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//------------------------TopView--------------------------------------
        
        //1.设置头部视图TopView
        _TopView = [[UIImageView alloc]init];
        [self.contentView addSubview:_TopView];
        
        /** 用户图像imageView */
        _userIconView = [[UIImageView alloc]init];
        [_TopView addSubview:_userIconView];
        
        /** 用户昵称label */
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = userNameFont;
        [_TopView addSubview:_userNameLabel];
        
        /** 用户会员等级ImageView */
        _mbrankView = [[UIImageView alloc]init];
        [_TopView addSubview:_mbrankView];
        
        /** 发布时间lable */
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = timeTextFont;
        _timeLabel.textColor = RGBColor(244, 163, 71);
        [_TopView addSubview:_timeLabel];
        
        /** 微博来源label */
        _sourceLabel = [[UILabel alloc]init];
        _sourceLabel.font = sourceTextFont;
        [_TopView addSubview:_sourceLabel];
        
        /** 原创微博正文label */
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = contentTextFont;
        [_TopView addSubview:_contentLabel];

        /** 原创微博单张配图imageView */
        _originalPhotoView = [[UIImageView alloc]init];
        [_TopView addSubview:_originalPhotoView];
        
        /** 原创微博多张配图View */
        _originalPhotosView = [[WBPhotosView alloc]init];
        [_TopView addSubview:_originalPhotosView];
        
//---------------------------MidView-----------------------------------
        
        //2.设置转发视图
        _MidView = [[UIImageView alloc]init];
        _MidView.image = [UIImage resizableImageWithCapInsetsWithImage:[UIImage imageNamed:@"timeline_card_retweet"] andRadios:@[@0.5,@0.5,@0.5,@0.5]];
        [self.contentView addSubview:_MidView];
        
        /** 转发微博正文label */
        _retweetedContentLabel = [[UILabel alloc]init];
        [_MidView addSubview:_retweetedContentLabel];
        
        /** 转发微博单张配图imageView */
        _retweetedPhotoView = [[UIImageView alloc]init];
        [_MidView addSubview:_retweetedPhotoView];
        
        /** 转发微博多张配图View */
        _retweetedPhotosView = [[WBPhotosView alloc]init];
        [_MidView addSubview:_retweetedPhotosView];
        
//---------------------------ToolBarView-----------------------------------
        
        //3.设置工具条视图
        _ToolBarView = [[UIImageView alloc]init];
        [self.contentView addSubview:_ToolBarView];
        
        /** 微博转发数 */
        _repostsButton = [[UIButton alloc]init];
        _repostsButton.titleLabel.font = ToolBarTextFont;
        [_repostsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ToolBarView addSubview:_repostsButton];
        
        /** 微博评论数 */
        _commentsButton = [[UIButton alloc]init];
        _commentsButton.titleLabel.font = ToolBarTextFont;
        [_commentsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ToolBarView addSubview:_commentsButton];
        
        /** 微博表态数 */
        _attitudesButton = [[UIButton alloc]init];
        _attitudesButton.titleLabel.font = ToolBarTextFont;
        [_attitudesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ToolBarView addSubview:_attitudesButton];
        
        /** 水平分割线 */
        _HorizionLine = [[UIImageView alloc]init];
        [_ToolBarView addSubview:_HorizionLine];
        
        /** 第一个竖直分割线 */
        _FirstVerituaLine = [[UIImageView alloc]init];
        [_ToolBarView addSubview:_FirstVerituaLine];
        
        /** 第二个竖直分割线 */
        _SecondVerituaLine = [[UIImageView alloc]init];
        [_ToolBarView addSubview:_SecondVerituaLine];
    }
    return self;
}


//设置微博的Frame
-(void)setWbStatusFrame:(WBStatusFrame *)wbStatusFrame{
    
    _wbStatusFrame = wbStatusFrame;
    
    //设置原创微博
    [self setupOriginalStatus:wbStatusFrame];
    
    //设置转发微博
    [self setupRetweetedStatus:wbStatusFrame];
    
    //设置工具条
    [self setupToolBar:wbStatusFrame];
}


/**
 *  拦截cell的frame
 *
 *  @param frame
 */
-(void)setFrame:(CGRect)frame{
    
    frame.origin.y += CellBorder;
    frame.origin.x = CellBorder;
    frame.size.width -= 2 * CellBorder;
    frame.size.height -= CellBorder;
    [super setFrame:frame];
}


/**
 *  设置原创微博
 *
 *  @param wbStatusFrame 微博的Frame模型
 */
-(void)setupOriginalStatus:(WBStatusFrame *)wbStatusFrame{
 
    //解决循环引用的问题
    if (_originalPhotoView) {
        [_originalPhotoView removeFromSuperview];
    }
    
    if (_originalPhotosView) {
        [_originalPhotosView removeFromSuperview];
    }
    
    //1.用户图像
    [_userIconView sd_setImageWithURL:[NSURL URLWithString:wbStatusFrame.wbStatus.user.avatar_large] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    _userIconView.frame = wbStatusFrame.userIconViewFrame;
    
    //2.用户昵称
    _userNameLabel.text = wbStatusFrame.wbStatus.user.name;
    _userNameLabel.frame = wbStatusFrame.userNameLabelFrame;
    
    //3.用户会员
    if (wbStatusFrame.wbStatus.user.mbtype) {
        
        _mbrankView.frame = wbStatusFrame.mbrankViewFrame;
        _mbrankView.image = [UIImage imageNamed:@"vip"];
    }
    
    //4.微博发布时间
    _timeLabel.text = wbStatusFrame.wbStatus.created_at;
    _timeLabel.frame = wbStatusFrame.timeLabelFrame;
    
    //5.微博来源
    _sourceLabel.text = wbStatusFrame.wbStatus.source;
    _sourceLabel.frame = wbStatusFrame.sourceLabelFrame;
    
    //6.原创微博正文
    if (wbStatusFrame.wbStatus.text) {
        _contentLabel.text = wbStatusFrame.wbStatus.text;
        _contentLabel.frame = wbStatusFrame.contentLabelFrame;
    }
    
    //7.设置原创微博配图
    //单张
    if (wbStatusFrame.wbStatus.pic_urls.count == 1){
        _originalPhotoView = [[UIImageView alloc]init];
        _originalPhotoView.frame = wbStatusFrame.originalPhotoFrame;
        [_TopView addSubview:_originalPhotoView];
        NSURL *URL = [NSURL URLWithString:[wbStatusFrame.wbStatus.pic_urls firstObject][@"thumbnail_pic"]];
        _originalPhotoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
    }
    //多张
    if (wbStatusFrame.wbStatus.pic_urls.count > 1){
        _originalPhotosView = [[WBPhotosView alloc]init];
        _originalPhotosView.frame = wbStatusFrame.originalPhotosFrame;
        [_TopView addSubview:_originalPhotosView];
        [_originalPhotosView setStatus:wbStatusFrame.wbStatus];
    }
    
    //8.设置头部视图frame
    _TopView.frame = wbStatusFrame.TopViewFrame;
}


/**
 *  设置转发微博
 *
 *  @param wbStatusFrame 微博的Frame模型
 */
-(void)setupRetweetedStatus:(WBStatusFrame *)wbStatusFrame{
    
    //解决循环引用的问题
    if (_retweetedContentLabel) {
        [_retweetedContentLabel removeFromSuperview];
    }
    if (_retweetedPhotoView) {
        [_retweetedPhotoView removeFromSuperview];
    }
    if (_retweetedPhotosView) {
        [_retweetedPhotosView removeFromSuperview];
    }
    
    
    //1.转发微博正文
    if (wbStatusFrame.wbStatus.retweeted_status.text) {
        _retweetedContentLabel = [[UILabel alloc]init];
        _retweetedContentLabel.frame = wbStatusFrame.retweetedContentLabelFrame;
        [_MidView addSubview:_retweetedContentLabel];
        _retweetedContentLabel.numberOfLines = 0;
        _retweetedContentLabel.font = contentTextFont;
        
        NSString *allTexts = [NSString stringWithFormat:@"@%@\n%@",wbStatusFrame.wbStatus.retweeted_status.user.name,wbStatusFrame.wbStatus.retweeted_status.text];
        NSMutableAttributedString *attributedStrM = [[NSMutableAttributedString alloc]initWithString:allTexts];
        [attributedStrM addAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, wbStatusFrame.wbStatus.retweeted_status.user.name.length+1)];
        _retweetedContentLabel.attributedText = attributedStrM;
    }
    
    //2.设置转发微博配图
    //单张
    if (wbStatusFrame.wbStatus.retweeted_status.pic_urls.count == 1){
        
        _retweetedPhotoView = [[UIImageView alloc]init];
        _retweetedPhotoView.frame = wbStatusFrame.retweetedPhotoFrame;
        [_MidView addSubview:_retweetedPhotoView];
        NSURL *URL = [NSURL URLWithString:[wbStatusFrame.wbStatus.retweeted_status.pic_urls firstObject][@"thumbnail_pic"]];
        _retweetedPhotoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
    }
    //多张
    if (wbStatusFrame.wbStatus.retweeted_status.pic_urls.count > 1){
        
        _retweetedPhotosView = [[WBPhotosView alloc]init];
        _retweetedPhotosView.frame = wbStatusFrame.retweetedPhotosFrame;
        [_MidView addSubview:_retweetedPhotosView];
        [_retweetedPhotosView setRetweetedStatus:wbStatusFrame.wbStatus.retweeted_status];
    }
    
    //7.设置转发视图frame
    _MidView.frame = wbStatusFrame.MidViewFrame;
}

/**
 *  设置微博工具条
 *
 *  @param wbStatusFrame 微博的Frame模型
 */
-(void)setupToolBar:(WBStatusFrame *)wbStatusFrame{

    //1.转发数
    [_repostsButton setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
    if (wbStatusFrame.wbStatus.reposts_count) {
       [_repostsButton setTitle:[NSString stringWithFormat:@"%ld",wbStatusFrame.wbStatus.reposts_count] forState:UIControlStateNormal];
    }else{
      [_repostsButton setTitle:@"转发" forState:UIControlStateNormal];
    }
    _repostsButton.frame = wbStatusFrame.repostsButtonFrame;
    
    //2.评论数
    [_commentsButton setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
    if (wbStatusFrame.wbStatus.comments_count) {
        [_commentsButton setTitle:[NSString stringWithFormat:@"%ld",(long)wbStatusFrame.wbStatus.comments_count] forState:UIControlStateNormal];
    }else{
        [_commentsButton setTitle:@"评论" forState:UIControlStateNormal];
    }
    _commentsButton.frame = wbStatusFrame.commentsButtonFrame;
    
    //3.表态数
    [_attitudesButton setImage:[UIImage imageNamed:@"timeline_icon_like_disable"] forState:UIControlStateNormal];
    if (wbStatusFrame.wbStatus.attitudes_count) {
        [_attitudesButton setTitle:[NSString stringWithFormat:@"%ld",(long)wbStatusFrame.wbStatus.attitudes_count] forState:UIControlStateNormal];
    }else{
       [_attitudesButton setTitle:@"点赞" forState:UIControlStateNormal];
    }
    _attitudesButton.frame = wbStatusFrame.attitudesButtonFrame;
    
    // 4.水平分割线
    _HorizionLine.frame = wbStatusFrame.HorizionLineFrame;
    _HorizionLine.image = [UIImage imageNamed:@"timeline_feedcard_original_bottom_background_highlighted"];
    
    // 5.第一个竖直分割线
    _FirstVerituaLine.frame = wbStatusFrame.FirstVerituaLineFrame;
    _FirstVerituaLine.image = [UIImage imageNamed:@"timeline_card_bottom_line_highlighted"];
    
    // 6.第二个竖直分割线
    _SecondVerituaLine.frame = wbStatusFrame.SecondVerituaLineFrame;
    _SecondVerituaLine.image = [UIImage imageNamed:@"timeline_card_bottom_line_highlighted"];
    
    //7.设置工具条frame
    _ToolBarView.frame = wbStatusFrame.ToolBarViewFrame;
    
}
@end
