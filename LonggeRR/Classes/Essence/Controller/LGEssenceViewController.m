//
//  LGEssenceViewController.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/12.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGEssenceViewController.h"
#import "UIBarButtonItem+Item.h"


@interface LGEssenceViewController ()

@end

@implementation LGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条内容
    [self setupNavigationBar];
}


- (void)setupNavigationBar
{
    //设置导航条内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_coin_icon"] highImage:[UIImage imageNamed:@"nav_coin_icon_click"] target:self action:@selector(game)];
    //右边
    UIBarButtonItem *item = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)game
{
    NSLog(@"点击了精华控制器右边的游戏按钮");
}

- (void)setting
{
    NSLog(@"点击了精华控制器右边的设置按钮");
}

@end
