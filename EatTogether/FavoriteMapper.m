//
//  FavoriteMapper.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "FavoriteMapper.h"
#import "Favorite.h"

@implementation FavoriteMapper

- (Favorite *)mapParseFavorite:(PFObject *)pfFavorite{
    
    Favorite *favorite = [[Favorite alloc] init];
    favorite.favoriteId = [pfFavorite valueForKey:@"favoriteId"];
    favorite.favoriteObjectId = [pfFavorite valueForKey:@"objectId"];
    favorite.favoriteObjectUserId = [pfFavorite valueForKey:@"objectIdU"];
    favorite.favoriteChek = [pfFavorite valueForKey:@"favoriteCheck"];
    favorite.favoriteAdvertisementId = [[pfFavorite valueForKey:kAdvertisementIdParse]valueForKey:@"objectId"];
    
    
    
//    favorite.favoriteAdvertisementDescription = [[pfFavorite valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDescriptionParse];
//    favorite.favoriteAdvertisementStarter = [[pfFavorite valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementStarterParse];

    
    return favorite;
}


@end

/*
  advertisement.advertisementMainDish = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementMainDishParse];
 advertisement.advertisementDessert = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDessertParse];
 advertisement.advertisementNumGuests = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementNumGuestsParse];
 advertisement.advertisementPrice = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPriceParse];
 advertisement.advertisementData = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementDateParse];
 
 advertisement.advertisementUserName = [[pfAdvertisement valueForKey:kAdvertisementUserUsername]valueForKey:kUserNameParse];
 
 advertisement.advertisementCityName = [[pfAdvertisement valueForKey:kAdvertisementCityIdParse] valueForKey:kCityNameParse];
 advertisement.advertisementLocationLongitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLongitudeParse];
 advertisement.advertisementLocationLatitude = [[pfAdvertisement valueForKey:kAdvertisementLocationIdParse] valueForKey:kLocationLatitudeParse];
 
 
 PFFile *imageFilePicturUrl = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse] valueForKey:kDetailAdvertisementPictureParse];
 advertisement.advertisementPictureUrl = imageFilePicturUrl.url;
 
 PFFile *imageFileUserPicturUrl = [[pfAdvertisement valueForKey:kAdvertisementUserUsername]valueForKey:kUserPictureParse];
 advertisement.advertisementUserPictureUrl = imageFileUserPicturUrl.url;
 
 advertisement.advertisementIdioms = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementIdiomsParse];
 advertisement.advertisementTopics = [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementTopicsParse];
 
 
 
 
 @property (nonatomic, strong) NSString *favoriteAdvertisementDescription;
 @property (nonatomic, strong) NSString *favoriteAdvertisementStarter;
 @property (nonatomic, strong) NSString *favoriteAdvertisementMainDish;
 @property (nonatomic, strong) NSString *favoriteAdvertisementDessert;
 @property (nonatomic, strong) NSNumber *favoriteAdvertisementNumGuests;
 @property (nonatomic, strong) NSNumber *favoriteAdvertisementPrice;
 @property (nonatomic, strong) NSDate *favoriteAdvertisementData;
 @property (nonatomic, strong) NSString *favoriteAdvertisementPictureUrl;
 @property (nonatomic, strong) NSString *favoriteAdvertisementCityName;
 @property (nonatomic, strong) NSString *favoriteAdvertisementUserName;
 @property (nonatomic, strong) NSString *favoriteAdvertisementLocationLatitude;
 @property (nonatomic, strong) NSString *favoriteAdvertisementLocationLongitude;
 @property (nonatomic, strong) NSString *favoriteAdvertisementCityLatitude;
 @property (nonatomic, strong) NSString *favoriteAdvertisementCityLongitude;
 @property (nonatomic, strong) NSString *favoriteAdvertisementUserPictureUrl;*/
