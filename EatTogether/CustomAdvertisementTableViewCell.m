//
//  CustomAdvertisementTableViewCell.m
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CustomAdvertisementTableViewCell.h"

@interface CustomAdvertisementTableViewCell()



@end

@implementation CustomAdvertisementTableViewCell

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
