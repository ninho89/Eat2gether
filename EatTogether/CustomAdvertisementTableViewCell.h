//
//  CustomAdvertisementTableViewCell.h
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAdvertisementTableViewCellDelegate <NSObject>

- (void)advertisementCell:(UITableViewCell *)cell didSetFavorite:(BOOL)favorite;

@end

@interface CustomAdvertisementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customUserImage;
@property (weak, nonatomic) IBOutlet UIImageView *customDetailImage;
@property (weak, nonatomic) IBOutlet UILabel *customLabelPrice;
@property (weak, nonatomic) IBOutlet UILabel *customLabelStarter;
@property (weak, nonatomic) IBOutlet UIButton *customFavoriteImage;
@property (nonatomic) BOOL check;

@property (nonatomic, weak) id<CustomAdvertisementTableViewCellDelegate> delegate;

@end
