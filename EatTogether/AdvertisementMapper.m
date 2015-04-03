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
    
    advertisement.advertisementObjectId = [pfAdvertisement valueForKey:@"objectId"];
    
    DetailAdvertisement *detailAdvertisement = [[DetailAdvertisement alloc]init];
    detailAdvertisement.detailObjectId = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.objectId"];
    detailAdvertisement.detailDescription = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementDescription"];
    detailAdvertisement.detailStarter = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementStarter"];
    detailAdvertisement.detailMainDish = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementMainDish"];
    detailAdvertisement.detailDessert = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementDessert"];
    detailAdvertisement.detailNumGuests = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementNumGuests"];
    detailAdvertisement.detailPrice = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementPrice"];
    detailAdvertisement.detailDate = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementDate"];
    detailAdvertisement.detailIdioms = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementIdioms"];
    detailAdvertisement.detailTopics = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementTopics"];
    PFFile *imageFilePicturUrl1 = [pfAdvertisement valueForKeyPath:@"detailAdvertisementId.detailAdvertisementPicture"];
    detailAdvertisement.detailPictureUrl = imageFilePicturUrl1.url;
    advertisement.detailAdvertisement = detailAdvertisement;
    
    User *user = [[User alloc]init];
    user.userObjectId = [pfAdvertisement valueForKeyPath:@"username.objectId"];
    user.username = [pfAdvertisement valueForKeyPath:@"username.username"];
    user.email = [pfAdvertisement valueForKeyPath:@"username.email"];
    PFFile *imageFileUserPicturUrl1 = [pfAdvertisement valueForKeyPath:@"username.userPicture"];
    user.userPicture = imageFileUserPicturUrl1.url;
    advertisement.user = user;
    
    City *city = [[City alloc]init];
    city.cityObjectId = [pfAdvertisement valueForKeyPath:@"cityId.objectId"];
    city.cityName = [pfAdvertisement valueForKeyPath:@"cityId.cityName"];
    city.cityState = [pfAdvertisement valueForKeyPath:@"cityId.cityState"];
    city.cityCountry = [pfAdvertisement valueForKeyPath:@"cityId.cityCountry"];
    city.cityLatitude = [pfAdvertisement valueForKeyPath:@"cityId.cityLatitude"];
    city.cityLongitude = [pfAdvertisement valueForKeyPath:@"cityId.cityLongitude"];
    advertisement.city = city;
    
    advertisement.advertisementLocationLatitude = [pfAdvertisement valueForKey:@"locationLatitude"];
    advertisement.advertisementLocationLongitude = [pfAdvertisement valueForKey:@"locationLongitude"];

    return advertisement;
}

@end
