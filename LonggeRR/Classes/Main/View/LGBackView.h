//
//  LGBackView.h
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGBackView : UIView

+ (instancetype)backViewWithImage:(UIImage *)imageNormal highImage:(UIImage *)imageHighlighted target:(id)target action: (SEL)action title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
