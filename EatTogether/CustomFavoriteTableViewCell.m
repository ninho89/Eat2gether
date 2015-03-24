//
//  CustomFavoriteTableViewCell.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CustomFavoriteTableViewCell.h"

@implementation CustomFavoriteTableViewCell

- (void)awakeFromNib {
    //    // Initialization code
    self.customUserImage.clipsToBounds = YES;
    self.customUserImage.layer.cornerRadius = self.customUserImage.bounds.size.height / 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
