//
//  ComposeButton.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ComposeButton.h"

@implementation ComposeButton

+(void)load{
    [super registerSubclass];
}

+(instancetype)plusButton{

    ComposeButton *composeButton = [[ComposeButton alloc]initWithFrame:CGRectMake(0, 0, 68, 47)];
    
    //设置背景
    [composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    //设置按钮
    [composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
    
    return composeButton;
}

//返回插入位置,因为是奇数,所以不用指定安放的位置,它会自动调整位置
//+ (NSUInteger)indexOfPlusButtonInTabBar{
//    
//    return 2;
//}

@end
