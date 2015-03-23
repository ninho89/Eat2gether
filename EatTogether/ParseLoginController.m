//
//  ParseLoginController.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "ParseLoginController.h"
#import "User.h"
#import "UserMapper.h"

@interface ParseLoginController ()

@property (nonatomic, strong) UserMapper *userMapper;

@end


@implementation ParseLoginController

-(void)loginInWithUsername:(NSString *)username password:(NSString *)password completionBlock:(void (^)(User *, NSError *))completionBlock{
    
    //query login parse    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
        
        User *user1 = [[User alloc]init];
        
        if (!error) {
            NSLog(@"Login user!");
        
            self.userMapper = [[UserMapper alloc]init];
            user1 = [self.userMapper mapParseUser:user];
            user1.username = [user valueForKey:@"username"];
            user1.password = [user valueForKey:@"password"];
            user1.email = [user valueForKey:@"email"];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ooops!" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        completionBlock(user1,nil);
        
    }];
    
}

//-(void)logoutWithCompletionBlock:(void (^)(NSError *))completionBlock{
//    
//    
//}

@end
