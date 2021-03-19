//
//  LGReverseButton.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGReverseButton.h"

@implementation LGReverseButton

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置imageView位置
    self.imageView.xmg_x = 0;
    self.imageView.xmg_y = 0;
    self.imageView.xmg_width = self.xmg_width;
    self.imageView.xmg_height = self.imageView.xmg_width;
    
    // 设置textLabel位置
    self.titleLabel.xmg_x = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.xmg_y = self.imageView.xmg_height;
    self.titleLabel.xmg_width = self.xmg_width;
    self.titleLabel.xmg_height = self.xmg_height - self.titleLabel.xmg_y;
}

@end
