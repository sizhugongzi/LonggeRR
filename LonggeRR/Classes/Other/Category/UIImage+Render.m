//
//  UIImage+Render.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "UIImage+Render.h"

@implementation UIImage (Render)

+ (UIImage *)imageNamedWithOriginal:(NSString *)name {
    UIImage *selImage = [UIImage imageNamed:name];
    [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return selImage;
}

@end
