//
//  LGFastLoginButton.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGFastLoginButton.h"

@implementation LGFastLoginButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置图片
    self.imageView.xmg_centerX = self.xmg_width * 0.5;
    self.imageView.xmg_y = 3;
    [self.titleLabel sizeToFit];
    self.titleLabel.xmg_centerX = self.xmg_width * 0.5;
    self.titleLabel.xmg_y = self.xmg_height - self.titleLabel.xmg_height;
}

@end
