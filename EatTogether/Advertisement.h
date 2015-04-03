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
#import "DetailAdvertisement.h"

@interface Advertisement : NSObject

@property (nonatomic, strong) NSString *advertisementObjectId;
@property (nonatomic, strong) DetailAdvertisement *detailAdvertisement;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSString *advertisementLocationLatitude;
@property (nonatomic, strong) NSString *advertisementLocationLongitude;

@end
