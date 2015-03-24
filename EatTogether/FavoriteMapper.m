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
    favorite.favoriteObjectUserId = [[pfFavorite valueForKey:@"objectIdU"]valueForKey:@"objectId"];
    favorite.favoriteAdvertisementObjectId = [[[pfFavorite valueForKey:@"advertisementId"]valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];
    
    favorite.favoriteUserName = [[pfFavorite valueForKey:@"objectIdU"]valueForKey:@"username"];
    favorite.favoriteUserEmail = [[pfFavorite valueForKey:@"objectIdU"]valueForKey:@"email"];
    favorite.favoriteChek = [pfFavorite valueForKey:@"favoriteCheck"];
    favorite.favoriteDetailAdvertisementId = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementId"];
    favorite.favoriteDetailAdvertisementObjectId = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];
    favorite.favoriteDetailAdvertisementDescription = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementDescription"];
    favorite.favoriteDetailAdvertisementStarter = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementStarter"];
    favorite.favoriteDetailAdvertisementMainDish = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementMainDish"];
    favorite.favoriteDetailAdvertisementDessert = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementDessert"];
    favorite.favoriteDetailAdvertisementNumGuests = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementNumGuests"];
    favorite.favoriteDetailAdvertisementPrice = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementPrice"];
    favorite.favoriteDetailAdvertisementData = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementDate"];
    favorite.favoriteDetailAdvertisementIdioms = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementIdioms"];
    favorite.favoriteDetailAdvertisementTopics = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementTopics"];
    
    PFFile *imageFile = [[pfFavorite valueForKey:@"objectIdU"]valueForKey:@"userPicture"];
    favorite.favoriteUserPicture = imageFile.url;
    
    PFFile *imageFile2 = [[pfFavorite valueForKey:@"detailAdvertisementId"]valueForKey:@"detailAdvertisementPicture"];
    favorite.favoriteDetailAdvertisementPictureUrl = imageFile2.url;
    
    return favorite;
}


@end


