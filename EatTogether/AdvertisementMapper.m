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
    advertisement.advertisementDescription = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDescriptionParse];
    advertisement.advertisementStarter = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementStarterParse];
    advertisement.advertisementMainDish = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementMainDishParse];
    advertisement.advertisementDessert = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDessertParse];
    advertisement.advertisementNumGuests = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementNumGuestsParse];
    advertisement.advertisementPrice = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPriceParse];
    advertisement.advertisementData = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDateParse];
    advertisement.advertisementUserName = [[pfAdvertisement valueForKey:kAdvertisementUserIdParse]valueForKey:kUserNameParse];
    advertisement.advertisementCityName = [[pfAdvertisement valueForKey:kAdvertisementCityIdParse] valueForKey:kCityNameParse];
    advertisement.advertisementLocationLongitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLongitudeParse];
    advertisement.advertisementLocationLatitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLatitudeParse];
    
    PFFile *imageFilePicturUrl = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPictureParse];
    advertisement.advertisementPictureUrl = imageFilePicturUrl.url;
    
    PFFile *imageFileUserPicturUrl = [[pfAdvertisement valueForKey:kAdvertisementUserIdParse]valueForKey:kUserPictureParse];
    advertisement.advertisementUserPictureUrl = imageFileUserPicturUrl.url;
    
    advertisement.advertisementIdioms = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementIdiomsParse];
    advertisement.advertisementTopics = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementTopicsParse];
    
    return advertisement;
    
}



@end
