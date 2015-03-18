//
//  Constants.h
//  EatTogetherPrueba
//
//  Created by Filippo Aresu on 16/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

//Constants City Table Parse
extern NSString * const kCityTableParse;
extern NSString * const kCityIdParse;
extern NSString * const kCityNameParse;
extern NSString * const kCityCountryParse;
extern NSString * const kCityLocationIdParse;
extern NSString * const kCityPictureParse;

//Constants Location Table Parse
extern NSString * const kLocationTableParse;
extern NSString * const kLocationIdParse;
extern NSString * const kLocationCityIdParse;
extern NSString * const kLocationLatitudeParse;
extern NSString * const kLocationLongitudeParse;

//Constants Advertisement Table Parse
extern NSString * const kAdvertisementTableParse;
extern NSString * const kAdvertisementIdParse;
extern NSString * const kAdvertisementDetailAdvertisementIdParse;
extern NSString * const kAdvertisementUserIdParse;
extern NSString * const kAdvertisementLocationIdPArse;

// Constants Custom Cell
extern NSString *const kCellCity;


@end
