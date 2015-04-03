//
//  detailAdvertisement.h
//  Eat2gether
//
//  Created by Filippo Aresu on 3/4/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailAdvertisement : NSObject

@property (nonatomic, strong) NSString *detailObjectId;
@property (nonatomic, strong) NSString *detailDescription;
@property (nonatomic, strong) NSString *detailStarter;
@property (nonatomic, strong) NSString *detailMainDish;
@property (nonatomic, strong) NSString *detailDessert;
@property (nonatomic, strong) NSNumber *detailNumGuests;
@property (nonatomic, strong) NSNumber *detailPrice;
@property (nonatomic, strong) NSDate *detailDate;
@property (nonatomic, strong) NSArray *detailIdioms;
@property (nonatomic, strong) NSArray *detailTopics;
@property (nonatomic, strong) NSString *detailPictureUrl;

@end
