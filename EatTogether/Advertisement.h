//
//  Advertisement.h
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Advertisement : NSObject

@property (nonatomic, strong) NSNumber *advertisementId;
@property (nonatomic, strong) NSNumber *advertisementDescription;
@property (nonatomic, strong) NSString *advertisementStarter;
@property (nonatomic, strong) NSNumber *advertisementMainDish;
@property (nonatomic, strong) NSNumber *advertisementDessert;
@property (nonatomic, strong) NSNumber *advertisementNumGuests;
@property (nonatomic, strong) NSNumber *advertisementPrice;
@property (nonatomic, strong) NSDate *advertisementData;
@property (nonatomic, strong) NSString *advertisementPictureUrl;
@property (nonatomic, strong) NSString *advertisementCityName;
@property (nonatomic, strong) NSString *advertisementUserName;
@property (nonatomic, strong) NSString *advertisementLocationLatitude;
@property (nonatomic, strong) NSString *advertisementLocationLongitude;
@property (nonatomic, strong) NSString *advertisementCityLatitude;
@property (nonatomic, strong) NSString *advertisementCityLongitude;
@property (nonatomic, strong) NSString *advertisementUserPictureUrl;

@property (nonatomic, strong) NSArray *advertisementIdioms;
@property (nonatomic, strong) NSArray *advertisementTopics;



@end
