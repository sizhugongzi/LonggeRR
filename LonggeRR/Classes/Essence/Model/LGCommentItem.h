//
//  LGCommentItem.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGUserItem;
NS_ASSUME_NONNULL_BEGIN

@interface LGCommentItem : NSObject

@property (nonatomic,strong) NSString *voiceuri;
@property (nonatomic,strong) NSString *voicetime;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) LGUserItem *userItem;
@property (nonatomic,strong) NSString *totalContent;

@end

NS_ASSUME_NONNULL_END
