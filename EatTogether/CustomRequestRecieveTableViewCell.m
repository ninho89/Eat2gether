//
//  CustomRequestRecieveTableViewCell.m
//  EatTogether
//
//  Created by Filippo Aresu on 25/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CustomRequestRecieveTableViewCell.h"

@implementation CustomRequestRecieveTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.customUserAdvImage.clipsToBounds = YES;
    self.customUserAdvImage.layer.cornerRadius = self.customUserAdvImage.bounds.size.height / 2.0f;

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
