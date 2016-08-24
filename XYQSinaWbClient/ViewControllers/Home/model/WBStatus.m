//
//  Status.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WBStatus.h"

@implementation WBStatus

#pragma mark 格式化时间
-(NSString *)created_at{
    
    return [self formateFromCreated_at:_created_at];
}

#pragma mark 格式化来源
-(NSString *)source{
    
    return [self formateFromSource:_source];
}


/**
 *  格式化时间
 *  "created_at" = "Mon Mar 26 21:28:28 +0800 2012";
 *  @param created_at 原格式时间
 *
 *  @return 格式化后的时间
 */
-(NSString *)formateFromCreated_at:(NSString *)created_at{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = kcreatedDateFormat;
    
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:kLocaleIdentifier];
    
    NSDate *date = [formatter dateFromString:created_at];
    
    NSDate *now = [NSDate date];
    
    // 比较帖子发布时间和当前时间
    NSTimeInterval timeInterval =  [now timeIntervalSinceDate:date];
    
    if(timeInterval < 60) //1分钟
    {
        return @"最近";
    }
    else if(timeInterval < 60*60)  //1小时
    {
        return [NSString stringWithFormat:@"%d分钟前",(int)timeInterval/60];
    }
    else if(timeInterval < 60*60*24) //1天
    {
        return [NSString stringWithFormat:@"%d小时前",(int)timeInterval/60/60];
    }
    
    return [NSString stringWithFormat:@"%.1lf",timeInterval];
}


/**
 *  格式化来源
 *  source = "<a href=\"http://weibo.com/\" rel=\"nofollow\">\U5fae\U535a weibo.com</a>";
 *  source = "<a href=\"http://app.weibo.com/t/feed/5yiHuw\" rel=\"nofollow\">iPhone 6 Plus</a>";
 *  @param source 原格式来源
 *  @return 格式化后的来源
 */
-(NSString *)formateFromSource:(NSString *)source{
    
    NSRange range = [_source rangeOfString:@"rel=\"nofollow\">"];
    NSString *rtn = _source ;
    if (range.location != NSNotFound) {
        NSRange range2 = NSMakeRange(range.location+range.length, _source .length-4-range.location-range.length);
        
        rtn = [_source  substringWithRange:range2];
        
        return [NSString stringWithFormat:@"来自 %@",rtn];
    }
    return [NSString stringWithFormat:@"来自 %@",rtn];
}
@end
