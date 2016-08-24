//
//  AppDelegate.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"

#import <CYLTabBarController.h>
#import <CYLTabBar.h>

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ComposeViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"

#import "AccountManager.h"
#import "Account.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


//设置主控制器
-(void)setMainRootViewContronller{
    
    //延迟启动图时间
    [NSThread sleepForTimeInterval:2.0];
    
    //创建CYLTabBarController的对象
    CYLTabBarController *CYLtabVC = [[CYLTabBarController alloc]init];
    
    //设置CYLTabBarController对象的标签栏属性按钮
    CYLtabVC.tabBarItemsAttributes = [self createTabBarItemsAttributes];
    
    //设置CYLTabBarController对象的标签栏子控制器数组
    CYLtabVC.viewControllers = [self createTabBarViewControllers];
    
    //设置tabbar按钮的文字颜色
    [self customizeInterface];
    
    //设置添加按钮的事件,模态出发布控制器
    if (CYLExternPushlishButton) {
        
        [CYLExternPushlishButton addTarget:self action:@selector(composeButtonClcked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //设置CYLTabBarController的对象的根控制器
    [self.window setRootViewController:CYLtabVC];
}


//设置登录控制器
-(void)setLoginRootViewController{
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.window setRootViewController:loginVC];
}


//判断设置窗体的根控制器
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    //获取帐户管理类的单例对象
    self.accountManager = [AccountManager sharedAccountManager];
    
    //判断当前账户是否有效和超期
    if ([self.accountManager isValidate] && ![self.accountManager.currentAccount isExpired]) {
        
        [self setMainRootViewContronller];
    }
    else{
        [self setLoginRootViewController];
    }
    

    return YES;
}


#pragma mark - 模态出发布控制器
-(void)composeButtonClcked:(id)sender{
    
    ComposeViewController *composeVC = [[ComposeViewController alloc]init];
    [self.window.rootViewController presentViewController:composeVC animated:YES completion:nil];
}


#pragma mark - 创建标签栏子控制器数组
-(NSArray *)createTabBarViewControllers{
    
    //主页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNaV = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    //消息
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNaV = [[UINavigationController alloc]initWithRootViewController:messageVC];
    
    //发现
    DiscoverViewController *foundVC = [[DiscoverViewController alloc]init];
    UINavigationController *foundNaV = [[UINavigationController alloc]initWithRootViewController:foundVC];
    
    //我的
    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNaV = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    return @[homeNaV,messageNaV,foundNaV,mineNaV];
}

#pragma mark - 创建标签栏按钮item数组
-(NSArray *)createTabBarItemsAttributes{
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"tabbar_home",
                            CYLTabBarItemSelectedImage : @"tabbar_home_selected",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"消息",
                            CYLTabBarItemImage : @"tabbar_message_center",
                            CYLTabBarItemSelectedImage : @"tabbar_message_center_selected",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"tabbar_discover",
                            CYLTabBarItemSelectedImage : @"tabbar_discover_selected",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"tabbar_profile",
                            CYLTabBarItemSelectedImage : @"tabbar_profile_selected",
                            };
    return @[ dict1, dict2, dict3, dict4];
}

#pragma mark - 设置tabbar按钮的文字颜色
- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[[UIImage imageNamed:@"tabbar_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0.5, 0, 0.5) resizingMode:UIImageResizingModeStretch]];
}
@end
