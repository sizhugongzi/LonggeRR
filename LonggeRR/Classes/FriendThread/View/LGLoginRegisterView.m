//
//  LGLoginRegisterView.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGLoginRegisterView.h"

@interface LGLoginRegisterView ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation LGLoginRegisterView

+ (instancetype)loginView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)registerView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

//加载xib完成的时候调用，把xib里面的所有的属性赋值
- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImage *image = self.loginButton.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.registerButton setBackgroundImage:image forState:UIControlStateNormal];
}

@end
