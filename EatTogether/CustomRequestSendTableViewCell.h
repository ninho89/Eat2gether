//
//  CustomRequestSendTableViewCell.h
//  EatTogether
//
//  Created by Filippo Aresu on 25/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomRequestSendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *customDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *customPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *customStarterLabel;
@property (weak, nonatomic) IBOutlet UIImageView *customPictureUser;
@property (weak, nonatomic) IBOutlet UIImageView *customPicureAdvertisement;

@end
