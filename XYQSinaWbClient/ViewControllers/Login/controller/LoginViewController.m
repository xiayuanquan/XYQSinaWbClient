//
//  LoginViewController.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "Account.h"
#import "AccountManager.h"
#import "AppDelegate.h"

@interface LoginViewController ()<UIWebViewDelegate>
@property (strong,nonatomic)UIWebView *webView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       
    //创建网页视图
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    
    //发送网络请求,在webView中打开OAuth认证的网址
    NSString *strURL = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",kStringOAuthURL,kStringAPPKey,kStringRedirectURL];
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:0 timeoutInterval:-1];
    [self.webView loadRequest:request];
}

#pragma mark - 网页视图代理方法
#pragma mark 通过网页视图的代理监听拦截接口网址，获取code
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *absoluteURL = request.URL.absoluteString;
    
    if ([absoluteURL hasPrefix:@"http://www.baidu.com"]) {
        
        //截取code
        NSRange range = [absoluteURL rangeOfString:@"code="];
        NSUInteger location = range.location + range.length;
        NSString *code = [absoluteURL substringFromIndex:location];
        
        //进行授权请求
        if ([code length]) {
            
            [self startAccessLoginOAuth:(NSString *)code];
        }
    }
    return YES;
}

#pragma mark - 进行登录授权请求,授权期内不用再进行授权
-(void)startAccessLoginOAuth:(NSString *)code{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    //设置POST参数
    NSDictionary *parameters = @{
                                 @"client_id":kStringAPPKey,
                                 @"client_secret":kStringAPPSecret,
                                 @"grant_type":@"authorization_code",
                                 @"code":code,
                                 @"redirect_uri":kStringRedirectURL
                                };
    
    //获取access_token
    [manager POST:kStringAccessTokenURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        //WCLog(@"%@",responseObject);
        
        //1.创建当前账户实例并初始化
        Account *account = [[Account alloc]initWithDic:responseObject];
        
        //2.创建账户管理实例的单例
        AccountManager *manager = [AccountManager sharedAccountManager];
        
        //3.保存帐户
        [manager saveAccountToArchiveFile:account];
        
        //4.设为当前帐户
        [manager setCurrentAccount:account];
        
        //5.设置主窗口为rootViewController,直接进入用户主页
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate setMainRootViewContronller];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        WCLog(@"授权失败:%@",error);
    }];
}

@end
