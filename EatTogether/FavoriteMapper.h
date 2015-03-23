//
//  FavoriteMapper.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Favorite.h"

@interface FavoriteMapper : NSObject

-(Favorite *)mapParseFavorite:(PFObject *)pfFavorite;

@end
