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

//get cities
-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//get cities with name
-(void) getCitiesAdvertisementWithCity:(NSString *)city WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//save favorite
-(void) setFavorite:(BOOL)favorite withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//get favorite with username
-(void) getFavoritesAdvertisementWithUsername:(NSString *)username WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//save reservation
-(void) setReservation:(BOOL)statusReservation withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//get reservations with username
-(void) getReservationWithUsername:(NSString *)username WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
//get reservations
-(void) getReservationWithUsername1:(NSString *)usernameAdv WithCompletionBlock:(void (^)(NSArray *, NSArray*, NSError *))completionBlock;
//get advertisements with user object id
-(void) getAdvertisementWithUserObjectId:(NSString *)userObjectId WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock;
@end

