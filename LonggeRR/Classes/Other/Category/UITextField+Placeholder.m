//
//  UITextField+Placeholder.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)

//设置占位文字颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //快速去设置 占位文字颜色
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    placeholderLabel.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    return placeholderLabel.textColor;
}

@end
