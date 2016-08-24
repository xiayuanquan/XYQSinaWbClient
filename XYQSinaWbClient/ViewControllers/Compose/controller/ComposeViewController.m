//
//  ComposeViewController.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
@property (strong,nonatomic)UIToolbar *topToolBar;
@end

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation ComposeViewController


/**
 *  设置工具栏
*/
-(void)viewWillAppear:(BOOL)animated{
    
    [[UIToolbar appearance]setTintColor:[UIColor brownColor]];
    
    self.topToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemBack:)];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *midItem = [[UIBarButtonItem alloc]initWithTitle:@"发布新微博" style:UIBarButtonItemStylePlain target:nil action:nil];
    [midItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [midItem setEnabled:NO];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemSend:)];
    
    self.topToolBar.items = @[leftItem,flexItem,midItem,flexItem,rightItem];
    
    [self.view addSubview:self.topToolBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"发布";
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - 返回按钮事件，关闭模态的发布控制器
-(void)leftItemBack:(UIBarButtonItem *)sender{
    
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 发布按钮事件,发布新的微博
-(void)rightItemSend:(UIBarButtonItem *)sender{
    
    NSLog(@"%s",__func__);
}

@end
