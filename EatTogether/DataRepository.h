//
//  DataRepository.h
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Advertisement.h"

@class User;

@protocol DataRepository <NSObject>

-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
-(void) getCitiesAdvertisementWithCity:(NSString *)city WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;

//peticion save favorite
-(void) setFavorite:(BOOL)favorit withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(Advertisement *, NSError *))completionBlock;
@end
