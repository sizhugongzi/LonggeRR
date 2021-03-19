//
//  LGVoiceTopicView.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGVoiceTopicView.h"
#import "LGTopicItem.h"
#import <UIImageView+WebCache.h>

@interface LGVoiceTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *playCountView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end

@implementation LGVoiceTopicView

- (void)setTopicItem:(LGTopicItem *)topicItem {
    [super setTopicItem: topicItem];
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:topicItem.image0]];
    _playCountView.text = [NSString stringWithFormat:@"%@播放",topicItem.playcount];
    NSInteger second = topicItem.voicetime % 60;
    NSInteger minute = topicItem.voicetime / 60;
    _timeView.text = [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

@end
