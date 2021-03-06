//
//  LGUserTableViewCell.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGUserTableViewCell.h"
#import "LGUserModel.h"
#import <UIImageView+WebCache.h>

@interface LGUserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *numView;

@end

@implementation LGUserTableViewCell

- (void)setUser:(LGUserModel *)user {
    _user = user;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"mainCellBackground"]];
    self.nameView.text = user.screen_name;
    CGFloat num = [user.fans_count floatValue];
    NSString *numStr = [NSString stringWithFormat:@"%@人关注",user.fans_count];
    if (num > 10000) {
        num = num / 10000;
        numStr = [NSString stringWithFormat:@"%.f万人关注",num] ;
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    self.numView.text = numStr;
}

@end
