//
//  AdvertisementMapper.h
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Advertisement.h"

@interface AdvertisementMapper : NSObject

- (Advertisement *)mapParseAdvertisement:(PFObject *)pfAdvertisement;

@end
