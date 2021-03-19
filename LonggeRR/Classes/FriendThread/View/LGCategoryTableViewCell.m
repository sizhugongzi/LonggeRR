//
//  LGCategoryTableViewCell.m
//  LGBuDeJie
//
//  Created by lg_handsome on 2017/3/14.
//  Copyright © 2017 lg_handsome All rights reserved.
//

#import "LGCategoryTableViewCell.h"
#import "LGCategoryItem.h"

@interface LGCategoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation LGCategoryTableViewCell

- (void)setCategory:(LGCategoryItem *)category {
    _category = category;
    
    self.nameView.text = category.name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.indicatorView.hidden = !selected;
    self.nameView.textColor = selected?[UIColor redColor]:[UIColor blackColor];
}

@end
