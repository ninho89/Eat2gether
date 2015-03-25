//
//  CustomRequestSendTableViewCell.m
//  EatTogether
//
//  Created by Filippo Aresu on 25/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CustomRequestSendTableViewCell.h"

@implementation CustomRequestSendTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.customPictureUser.clipsToBounds = YES;
    self.customPictureUser.layer.cornerRadius = self.customPictureUser.bounds.size.height / 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
