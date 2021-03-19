//
//  NSDate+Date.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Date)

- (BOOL)isThisYear;

- (BOOL)isThisToday;

- (BOOL)isThisYesterday;

- (NSDateComponents *)datalWithNow;

@end

NS_ASSUME_NONNULL_END
