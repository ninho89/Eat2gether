//
//  CustomRequestRecieveTableViewCell.h
//  EatTogether
//
//  Created by Filippo Aresu on 25/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomRequestRecieveTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *customUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *customDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *customDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *customPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *customUserAdvImage;


@end
