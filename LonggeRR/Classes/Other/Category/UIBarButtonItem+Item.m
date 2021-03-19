//
//  UIBarButtonItem+Item.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (instancetype)itemWithImage:(UIImage *)imageNormal highImage:(UIImage *)imageHighlighted target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:imageNormal forState:UIControlStateNormal];
    [btn setImage:imageHighlighted forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)itemWithImage:(UIImage *)imageNormal imageSelected:(UIImage *)imageSelected target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:imageNormal forState:UIControlStateNormal];
    [btn setImage:imageSelected forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

@end
