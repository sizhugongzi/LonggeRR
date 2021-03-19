//
//  LGSquareCollectionViewCell.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGSquareCollectionViewCell.h"
#import "LGSquareItem.h"
#import <UIImageView+WebCache.h>

@interface LGSquareCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation LGSquareCollectionViewCell

- (void)setItem:(LGSquareItem *)item {
    _item = item;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    _nameView.text = item.name;
}

@end
