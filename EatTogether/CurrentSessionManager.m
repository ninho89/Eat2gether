//
//  CurrentSessionManager.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "CurrentSessionManager.h"
#import "LoginController.h"
#import "ParseLoginController.h"


@interface CurrentSessionManager ()

@property (nonatomic, strong) id <LoginController> loginController;

@end

@implementation CurrentSessionManager

+(instancetype)sharedInstance{
    
    static CurrentSessionManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return  instance;
}

-(instancetype)init{
    if (self = [super init]) {
        _loginController = [[ParseLoginController alloc]init];
    }
    return  self;
}


-(void)registerWithUsername:(NSString *)username password:(NSString *)password email:(NSString*)email completionBlock:(void(^)(User *user, NSError *error))completionBlock{
    
    [self.loginController registerWithUsername:username password:password email:email completionBlock:^(User *user, NSError *error) {
        _currentUser = user;
        if (completionBlock) {
            completionBlock(user, error);
        }
        
    }];
}

-(void)loginInWithUsername:(NSString *)username password:(NSString *)password completionBlock:(void (^)(User *, NSError *))completionBlock{
    
    [self.loginController loginInWithUsername:username password:password completionBlock:^(User *user, NSError *error) {
        _currentUser = user;
        if (completionBlock) {
            completionBlock(user, error);
        }
    }];
}

-(void)logoutWithCompletionBlock:(void (^)(User *, NSError *))completionBlock{
    
    [self.loginController logoutWithCompletionBlock:^(User *user, NSError *error) {
        if (!error) {
            _currentUser = user;
        }
        if(completionBlock){
            completionBlock(_currentUser, error);
        }
    }];
}

-(BOOL)isLoggedIn{
    return self.currentUser != nil;
}


@end
