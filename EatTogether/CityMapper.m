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
    
    return city;
}

@end
