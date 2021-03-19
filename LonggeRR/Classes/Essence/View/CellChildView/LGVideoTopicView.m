//
//  LGVideoTopicView.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGVideoTopicView.h"
#import "LGTopicItem.h"
#import <UIImageView+WebCache.h>

@interface LGVideoTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *playCountView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end

@implementation LGVideoTopicView

- (void)setTopicItem:(LGTopicItem *)topicItem
{
    [super setTopicItem: topicItem];
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:topicItem.image0]];
    
    _playCountView.text = [NSString stringWithFormat:@"%@播放",topicItem.playcount];
    
    NSInteger second = topicItem.videotime % 60;
    NSInteger minute = topicItem.videotime / 60;
    
    _timeView.text = [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

@end
