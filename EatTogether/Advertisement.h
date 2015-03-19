//
//  Advertisement.h
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Advertisement : NSObject

@property (nonatomic, strong) NSNumber *advertisementId;
@property (nonatomic, strong) NSString *advertisementStarter;
@property (nonatomic, strong) NSString *advertisementPictureUrl;
@property (nonatomic, strong) NSString *advertisementPrice;
@property (nonatomic, strong) NSString *advertisementCityName;
@property (nonatomic, strong) NSString *advertisementUserName;
@property (nonatomic, strong) NSString *advertisementLocationLatitude;
@property (nonatomic, strong) NSString *advertisementLocationLongitude;
@property (nonatomic, strong) NSString *advertisementUserPictureUrl;



@end
