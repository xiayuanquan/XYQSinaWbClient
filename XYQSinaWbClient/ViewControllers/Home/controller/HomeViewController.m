//
//  ViewController.m
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "AccountManager.h"
#import "Account.h"
#import "WBStatus.h"
#import "WBStatusFrame.h"
#import "HomeCell.h"

@interface HomeViewController ()
@property (strong,nonatomic)NSMutableArray *statuesFrames;   //存放微博模型的可变数组
@property (strong,nonatomic)MJRefreshHeader *header;         //头部下拉刷新控件
@property (strong,nonatomic)MJRefreshFooter *footer;         //尾部部上拉刷新控件
@property (strong,nonatomic)UILabel *showLabel;              //刷新新增数据提示标签
@end

static const CGFloat navigationBarHeight = 64;
static const CGFloat messageLabelHeight = 20;


@implementation HomeViewController

/** 微博数组 */
-(NSMutableArray *)statuesFrames{
    if (!_statuesFrames) {
        
        _statuesFrames = [NSMutableArray array];
    }
    return _statuesFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"首页";
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, CellBorder, 0)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = RGBColor(226, 226, 226);
    
    //获取当前用户的微博信息
    [self getUserStatuesInfo];
    
    //添加下拉刷新控件
    self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateStatues)];
    [self.tableView addSubview:self.header];
    
    //添加上拉刷新控件
    self.footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(updateStatues)];
    [self.tableView addSubview:self.footer];
    
    //刷新新增数据提示标签
    self.showLabel = [[UILabel alloc]init];
    self.showLabel.frame = CGRectMake(0, navigationBarHeight-messageLabelHeight,[UIScreen mainScreen].bounds.size.width, messageLabelHeight);
    self.showLabel.font = sourceTextFont;
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    self.showLabel.backgroundColor = [UIColor redColor];
    self.showLabel.hidden = YES;
    [self.navigationController.navigationBar insertSubview:self.showLabel atIndex:0];
}

#pragma mark 更新和加载微博数据
-(void)updateStatues{
    
    [self getUserStatuesInfo];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.header respondsToSelector:@selector(beginRefreshing)]) {
            [self.header endRefreshing];
        }
        [self.header endRefreshing];
        [self.footer endRefreshing];
        [self.tableView reloadData];
        
        // 动画显示showLabel
        [UIView animateWithDuration:1.0f animations:^{
            CGRect frame = self.showLabel.frame;
            frame.origin.y = navigationBarHeight + messageLabelHeight;
            self.showLabel.frame = frame;
            self.showLabel.hidden = NO;
        }];
        
        // 动画隐藏showLabel
        [UIView animateWithDuration:1.0f animations:^{
            
            CGRect frame = self.showLabel.frame;
            frame.origin.y = navigationBarHeight - messageLabelHeight;
            self.showLabel.frame = frame;
            self.showLabel.text = [NSString stringWithFormat:@"刷出%ld条新数据",self.statuesFrames.count];
            
        } completion:^(BOOL finished) {
            //移除showLabel
            [self.showLabel removeFromSuperview];
        }];
    });
}

#pragma mark 数据源方法
/** 返回行数 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.statuesFrames.count;
}

/** 返回单元格内容 */
-(HomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIdentifier = @"Cell";
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectedBackgroundView = [[UIView alloc]init];
    
    //cell传递微博Frame模型
    WBStatusFrame *wbstatusFrame = [self.statuesFrames objectAtIndex:indexPath.row];
    cell.wbStatusFrame = wbstatusFrame;
    return cell;
}

#pragma mark - 获取当前用户的微博信息
-(void)getUserStatuesInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];

    //设置GET参数
    AccountManager *accountManager = [AccountManager sharedAccountManager];
    NSString *access_token = accountManager.currentAccount.access_token;
    NSDictionary *parameters =@{@"access_token":access_token};
    
    [manager GET:kStatuesFriendTimeLineURL parameters:parameters progress:nil
     
    success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {

        //通过字一个字典数组创建微博模型数组
        NSArray *statusArray = [NSArray array];
        statusArray = [WBStatus mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        //遍历微博模型数组,创建并传递微博Frame模型对象
        [statusArray enumerateObjectsUsingBlock:^(WBStatus *status, NSUInteger idx, BOOL * _Nonnull stop) {
            WBStatusFrame *statusFrame = [[WBStatusFrame alloc]init];
            statusFrame.wbStatus = status;
            [self.statuesFrames addObject:statusFrame];
        }];
        
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        WCLog(@"%@",error);
    }];
}

#pragma mark 返回单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WBStatusFrame *wbstatusFrame = [self.statuesFrames objectAtIndex:indexPath.row];
    return wbstatusFrame.CellHeight;
}
@end
