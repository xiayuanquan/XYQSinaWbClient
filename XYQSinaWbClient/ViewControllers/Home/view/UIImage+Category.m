//
//  UIImage+Category.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/2/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)
/**
 *  设置拉伸图片
 *
 *  @param image  需要拉伸的图片
 *  @param radios 存放着上下左右宽高的拉伸系数数组
 *
 *  @return 拉伸后的图片
 */
+(UIImage *)resizableImageWithCapInsetsWithImage:(UIImage *)image andRadios:(NSArray *)radios
{
    CGFloat top = image.size.width * [radios[0] floatValue];
    CGFloat left = image.size.height * [radios[1] floatValue];
    CGFloat bottom = image.size.width * [radios[2] floatValue];
    CGFloat right = image.size.height * [radios[3] floatValue];
    return [image  resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right) resizingMode:UIImageResizingModeStretch];
}
@end
