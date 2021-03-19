//
//  UIBarButtonItem+Item.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Item)

+ (instancetype)itemWithImage:(UIImage *)imageNormal highImage:(UIImage *)imageHighlighted target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)imageNormal imageSelected:(UIImage *)imageSelected target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
