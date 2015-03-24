//
//  CurrentSessionManager.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface CurrentSessionManager : NSObject

@property (nonatomic, readonly) User *currentUser;
@property (nonatomic, readonly, getter=isLoggedIn) BOOL loggedIn;


-(void)registerWithUsername:(NSString *)username password:(NSString *)password email:(NSString*)email completionBlock:(void(^)(User *user, NSError *error))completionBlock;

-(void)loginInWithUsername:(NSString *)username password:(NSString *)password completionBlock:(void(^)(User *user, NSError *error))completionBlock;

-(void)logoutWithCompletionBlock:(void(^)(User *user, NSError *error))completionBlock;

+(instancetype) sharedInstance;

@end
