//
//  LGBaseTopicView.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGTopicItem;
NS_ASSUME_NONNULL_BEGIN

@interface LGBaseTopicView : UIView

@property (nonatomic,strong) LGTopicItem *topicItem;

+ (instancetype)viewForNib;

@end

NS_ASSUME_NONNULL_END
