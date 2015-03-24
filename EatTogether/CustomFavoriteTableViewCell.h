//
//  CustomFavoriteTableViewCell.h
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFavoriteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *customUserImage;
@property (weak, nonatomic) IBOutlet UIImageView *customDetailImage;
@property (weak, nonatomic) IBOutlet UILabel *customLabelPrice;
@property (weak, nonatomic) IBOutlet UILabel *customLabelStarter;

@end
