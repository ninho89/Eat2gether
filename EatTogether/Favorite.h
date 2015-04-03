//
//  Favorite.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favorite : NSObject

@property (nonatomic, strong) NSString *favoriteObjectId;
@property (nonatomic, strong) NSString *favoriteObjectUserId;
@property (nonatomic, strong) NSString *favoriteAdvertisementObjectId;
@property (nonatomic) BOOL favoriteChek;

@end
