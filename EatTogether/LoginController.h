//
//  LoginController.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@protocol LoginController <NSObject>

-(void)loginInWithUsername:(NSString *)username password:(NSString *)password completionBlock:(void(^)(User *user, NSError *error))completionBlock;

-(void)logoutWithCompletionBlock:(void(^)(User *user, NSError *error))completionBlock;


-(void)registerWithUsername:(NSString *)username password:(NSString *)password email:(NSString*)email completionBlock:(void(^)(User *user, NSError *error))completionBlock;

@end
