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

-(void)loginInWithUsername:(NSString *)username password:(NSString *)password completionBlock:(void (^)(User *, NSError *))completionBlock{
    
    [self.loginController loginInWithUsername:username password:password completionBlock:^(User *user, NSError *error) {
        _currentUser = user;
        if (completionBlock) {
            completionBlock(user, error);
        }
    }];
}

//-(void)logoutWithCompletionBlock:(void (^)(NSError *))completionBlock{
//    
//    [self.loginController logoutWithCompletionBlock:^(NSError *error) {
//        if (!error) {
//            _currentUser = nil;
//        }
//        if(completionBlock){
//            completionBlock(error);
//        }
//    }];
//    
//}

-(BOOL)isLoggedIn{
    return self.currentUser != nil;
}




@end
