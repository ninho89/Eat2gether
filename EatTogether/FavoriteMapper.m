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
    
    favorite.favoriteObjectId = [pfFavorite valueForKey:@"objectId"];
    favorite.favoriteObjectUserId = [[pfFavorite valueForKey:@"objectIdU"]valueForKey:@"objectId"];
    favorite.favoriteAdvertisementObjectId = [[[pfFavorite valueForKey:@"advertisementId"]valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];

    return favorite;
}


@end


