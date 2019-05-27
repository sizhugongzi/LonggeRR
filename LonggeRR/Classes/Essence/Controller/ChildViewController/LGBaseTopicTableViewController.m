//
//  LGBaseTopicTableViewController.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/22.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGBaseTopicTableViewController.h"
#import "AFHTTPSessionManager+Manager.h"
#import "LGTopicItem.h"
#import <MJExtension/MJExtension.h>
#import "LGTopicCell.h"
#import "LGTopicViewModel.h"
#import <MJRefresh/MJRefresh.h>
#import <SVProgressHUD.h>
#import "LGNewViewController.h"

static NSString * const ID = @"cell";

@interface LGBaseTopicTableViewController ()

@property (nonatomic,strong) NSMutableArray *topicsViewModel;
/** 用来加载下一页数据的参数 */
@property (nonatomic, copy) NSString *maxtime;
/** 发送请求的管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation LGBaseTopicTableViewController

- (NSMutableArray *)topicsViewModel
{
    if (!_topicsViewModel) {
        _topicsViewModel = [NSMutableArray array];
    }
    return _topicsViewModel;
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager xl_manger];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.tableView registerClass:[LGTopicCell class] forCellReuseIdentifier:ID];
    //添加上下拉刷新
    [self setupRefreshView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)setupRefreshView
{
    //添加下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    //上拉刷新
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.automaticallyHidden = YES;
    self.tableView.mj_footer = footer;
}
//请求数据
-(void)loadNewData
{
    // 取消请求
    // 仅仅是取消请求, 不会关闭session
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    
    NSString *a = @"list";
    //判断是精华还是新帖
    if ([self.parentViewController isKindOfClass:[LGNewViewController class]]) {
        a = @"newlist";
    }
    parameters[@"a"] = a;
    parameters[@"c"] = @"data";
    parameters[@"type"] = self.type;
    
    [self.manager GET:LGBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        //结束头部刷新
        [self.tableView.mj_header endRefreshing];
        
//        if (self.topicsViewModel != nil) {
//            return;
//        }
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        //字典转模型
        NSArray *topics = [LGTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //计算Cell的尺寸
        for (LGTopicItem *item in topics) {
            LGTopicViewModel *vm = [[LGTopicViewModel alloc] init];
            //给Item赋值和计算cell高度和子控件尺寸
            vm.topicItem = item;
            [self.topicsViewModel addObject:vm];
        }
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 结束刷新(恢复刷新控件的状态)
        [self.tableView.mj_header endRefreshing];
        
        // 如果是因为取消任务来到failure这个block, 就直接返回, 不需要提醒错误信息
        if (error.code == NSURLErrorCancelled) return;
        
        // 请求失败的提醒
        [SVProgressHUD showErrorWithStatus:@"网络繁忙,请稍后再试!"];
    }];
}
//加载更多
-(void)loadMoreData
{
    // 取消请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *a = @"list";
    //判断是精华还是新帖
    if ([self.parentViewController isKindOfClass:[LGNewViewController class]]) {
        a = @"newlist";
    }
    parameters[@"a"] = a;
    parameters[@"c"] = @"data";
    parameters[@"type"] = self.type;
    parameters[@"maxtime"] = self.maxtime;
    
    [self.manager GET:LGBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        //字典转模型
        NSArray *topics = [LGTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //计算Cell的尺寸
        for (LGTopicItem *item in topics) {
            LGTopicViewModel *vm = [[LGTopicViewModel alloc] init];
            //给Item赋值和计算cell高度和子控件尺寸
            vm.topicItem = item;
            [self.topicsViewModel addObject:vm];
        }
        //刷新表格
        [self.tableView reloadData];
        
        //结束加载更多
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 结束刷新(恢复刷新控件的状态)
        [self.tableView.mj_footer endRefreshing];
        
        // 如果是因为取消任务来到failure这个block, 就直接返回, 不需要提醒错误信息
        if (error.code == NSURLErrorCancelled) return;
        
        // 请求失败的提醒
        [SVProgressHUD showErrorWithStatus:@"网络繁忙,请稍后再试!"];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicsViewModel.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.viewModel = self.topicsViewModel[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.topicsViewModel[indexPath.row] cellH];
}

@end
