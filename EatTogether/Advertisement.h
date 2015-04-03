//
//  Advertisement.h
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "City.h"

@interface Advertisement : NSObject

@property (nonatomic, strong) NSString *advertisementObjectId;
@property (nonatomic, strong) NSString *advertisementDetailObjectId;
@property (nonatomic, strong) NSString *advertisementDescription;
@property (nonatomic, strong) NSString *advertisementStarter;
@property (nonatomic, strong) NSString *advertisementMainDish;
@property (nonatomic, strong) NSString *advertisementDessert;
@property (nonatomic, strong) NSNumber *advertisementNumGuests;
@property (nonatomic, strong) NSNumber *advertisementPrice;
@property (nonatomic, strong) NSDate *advertisementData;
@property (nonatomic, strong) NSString *advertisementPictureUrl;
@property (nonatomic, strong) NSString *advertisementCityName;
@property (nonatomic, strong) NSString *advertisementUserNameObjectId;

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) City *city;

@property (nonatomic, strong) NSString *advertisementLocationLatitude;
@property (nonatomic, strong) NSString *advertisementLocationLongitude;
@property (nonatomic, strong) NSString *advertisementCityLatitude;
@property (nonatomic, strong) NSString *advertisementCityLongitude;
@property (nonatomic, strong) NSArray *advertisementIdioms;
@property (nonatomic, strong) NSArray *advertisementTopics;




@end
