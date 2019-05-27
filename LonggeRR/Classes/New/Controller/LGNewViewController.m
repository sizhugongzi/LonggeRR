//
//  LGNewViewController.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/12.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGNewViewController.h"
#import "UIBarButtonItem+Item.h"

@interface LGNewViewController ()

@end

@implementation LGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条内容
    [self setupNavigationBar];
}

- (void)setupNavigationBar
{
    //设置导航条内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(subClick)];
}
- (void)subClick
{
    NSLog(@"我这个功能还没做好");
}
@end
