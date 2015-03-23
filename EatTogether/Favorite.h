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
@property (nonatomic, strong) NSString *favoriteAdvertisementId;
@property (nonatomic) BOOL favoriteChek;

/*
@property (nonatomic, strong) NSString *favoriteAdvertisementDescription;
@property (nonatomic, strong) NSString *favoriteAdvertisementStarter;
@property (nonatomic, strong) NSString *favoriteAdvertisementMainDish;
@property (nonatomic, strong) NSString *favoriteAdvertisementDessert;
@property (nonatomic, strong) NSNumber *favoriteAdvertisementNumGuests;
@property (nonatomic, strong) NSNumber *favoriteAdvertisementPrice;
@property (nonatomic, strong) NSDate *favoriteAdvertisementData;
@property (nonatomic, strong) NSString *favoriteAdvertisementPictureUrl;
@property (nonatomic, strong) NSString *favoriteAdvertisementCityName;
@property (nonatomic, strong) NSString *favoriteAdvertisementUserName;
@property (nonatomic, strong) NSString *favoriteAdvertisementLocationLatitude;
@property (nonatomic, strong) NSString *favoriteAdvertisementLocationLongitude;
@property (nonatomic, strong) NSString *favoriteAdvertisementCityLatitude;
@property (nonatomic, strong) NSString *favoriteAdvertisementCityLongitude;
@property (nonatomic, strong) NSString *favoriteAdvertisementUserPictureUrl;
*/







@end
