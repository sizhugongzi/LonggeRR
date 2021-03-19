//
//  LGUserTableViewCell.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGUserModel;
NS_ASSUME_NONNULL_BEGIN

@interface LGUserTableViewCell : UITableViewCell

@property (nonatomic,strong) LGUserModel *user;

@end

NS_ASSUME_NONNULL_END
