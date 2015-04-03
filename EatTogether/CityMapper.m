//
//  CityMapper.m
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CityMapper.h"

@implementation CityMapper

- (City *)mapParseCity:(PFObject *)pfCity{
    
    City *city = [[City alloc] init];
    city.cityObjectId = [pfCity valueForKey:@"objectId"];
    city.cityName = [pfCity valueForKey:@"cityName"];
    city.cityCountry = [pfCity valueForKey:@"cityCountry"];
    city.cityState = [pfCity valueForKey:@"cityState"];
    city.cityLatitude = [pfCity valueForKey:@"locationLatitude"];
    city.cityLongitude = [pfCity valueForKey:@"locationLongitude"];
    PFFile *imageFile = [pfCity objectForKey:@"cityPicture"];
    city.cityPictureUrl = imageFile.url;
    
    return city;
}

@end

