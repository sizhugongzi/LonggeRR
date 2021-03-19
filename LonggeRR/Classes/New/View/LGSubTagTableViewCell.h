//
//  LGSubTagTableViewCell.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGSubTagItem.h"

@class LGSubTagItem;
NS_ASSUME_NONNULL_BEGIN

@interface LGSubTagTableViewCell : UITableViewCell

@property (nonatomic,strong) LGSubTagItem *item;
+(instancetype)cell;

@end

NS_ASSUME_NONNULL_END
