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
    city.cityName = [pfCity valueForKey:kCityNameParse];
    city.cityCountry = [pfCity valueForKey:kCityCountryParse];
    
    PFFile *imageFile = [pfCity objectForKey:kCityPictureParse];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        city.cityPicture = [UIImage imageWithData:[imageFile getData]];
//    });
    
    city.cityPicture = imageFile.url;
    
    return city;
}

@end

