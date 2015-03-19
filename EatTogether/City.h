//
//  City.h
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, strong) NSString *cityObjectId;
@property (nonatomic, strong) NSNumber *cityId;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityCountry;
@property (nonatomic, strong) NSString *cityPictureUrl;
@property (nonatomic, strong) NSString *cityLatitude;
@property (nonatomic, strong) NSString *cityLongitude;

@end
