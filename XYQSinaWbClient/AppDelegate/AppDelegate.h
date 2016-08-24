//
//  AppDelegate.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccountManager;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AccountManager *accountManager;

-(void)setMainRootViewContronller;
-(void)setLoginRootViewController;
@end

