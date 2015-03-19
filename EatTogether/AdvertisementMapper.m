//
//  AdvertisementMapper.m
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "AdvertisementMapper.h"

@implementation AdvertisementMapper

- (Advertisement *)mapParseAdvertisement:(PFObject *)pfAdvertisement{
    
    Advertisement *advertisement = [[Advertisement alloc]init];
    advertisement.advertisementId = [pfAdvertisement valueForKey:kAdvertisementIdParse];
    advertisement.advertisementStarter = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementStarterParse];
    
    PFFile *imageFilePicturUrl = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPictureParse];
    advertisement.advertisementPictureUrl = imageFilePicturUrl.url;
    
    advertisement.advertisementPrice = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPriceParse];
    advertisement.advertisementCityName = [[pfAdvertisement valueForKey:kAdvertisementCityIdParse] valueForKey:kCityNameParse];
    advertisement.advertisementUserName = [[pfAdvertisement valueForKey:kAdvertisementUserIdParse]valueForKey:kUserNameParse];
    advertisement.advertisementLocationLongitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLongitudeParse];
    advertisement.advertisementLocationLatitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLatitudeParse];
    
    PFFile *imageFileUserPicturUrl = [[pfAdvertisement valueForKey:kAdvertisementUserIdParse]valueForKey:kUserPictureParse];
    advertisement.advertisementUserPictureUrl = imageFileUserPicturUrl.url;
    
    
    return advertisement;
    
}



@end
