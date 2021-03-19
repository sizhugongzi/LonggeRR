//
//  LGCommentItem.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGCommentItem.h"
#import "LGUserItem.h"

@implementation LGCommentItem

-(NSString *) totalContent
{
    return [NSString stringWithFormat:@"%@:%@",self.userItem.username,self.content];
}

@end
