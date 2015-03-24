//
//  Favorite.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favorite : NSObject


@property (nonatomic, strong) NSNumber *favoriteId;
@property (nonatomic, strong) NSString *favoriteObjectId;
@property (nonatomic, strong) NSString *favoriteObjectUserId;
@property (nonatomic, strong) NSString *favoriteUserName;
@property (nonatomic, strong) NSString *favoriteUserEmail;
@property (nonatomic, strong) NSString *favoriteUserPicture;
@property (nonatomic) BOOL favoriteChek;
@property (nonatomic, strong) NSString *favoriteAdvertisementObjectId;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementId;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementObjectId;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementDescription;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementStarter;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementMainDish;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementDessert;
@property (nonatomic, strong) NSNumber *favoriteDetailAdvertisementNumGuests;
@property (nonatomic, strong) NSNumber *favoriteDetailAdvertisementPrice;
@property (nonatomic, strong) NSDate *favoriteDetailAdvertisementData;
@property (nonatomic, strong) NSString *favoriteDetailAdvertisementPictureUrl;
@property (nonatomic, strong) NSArray *favoriteDetailAdvertisementIdioms;
@property (nonatomic, strong) NSArray *favoriteDetailAdvertisementTopics;








@end
