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

-(void)registerWithUsername:(NSString *)username password:(NSString *)password email:(NSString*)email completionBlock:(void(^)(User *user, NSError *error))completionBlock{
    
    
    NSData *userImage = UIImagePNGRepresentation([UIImage imageNamed:@"imageUserDefault"]);
    PFFile *imageUserDefault = [PFFile fileWithName:@"imageUserDefault.png" data:userImage];
    
    //query register user
    PFUser *newUser = [PFUser user];
    newUser.username = username;
    newUser.email = email;
    newUser.password = password;
    [newUser setObject:imageUserDefault forKey:@"userPicture"];

    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        User *user1 = [[User alloc]init];
        if (!error) {
            NSLog(@"Registration success!");
            
            self.userMapper = [[UserMapper alloc]init];
            user1 = [self.userMapper mapParseUser:newUser];
            user1.username = username;
            user1.password = password;
            user1.email = email;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enhorabuena!" message:@"Usuario creado correctamente" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else {
            NSLog(@"Hubo un error en la creacion del usuario");
        }
        completionBlock(user1, error);
    }];
}

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
            
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Correcto" message:@"Te has loagueado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert show];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ooops!" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        completionBlock(user1,error);
    }];
}

-(void)logoutWithCompletionBlock:(void(^)(User *user, NSError *error))completionBlock{
    
    NSError *error;
    
    //query logout parse
    [PFUser logOut];
    User *user1 = [[User alloc]init];
    user1 = nil;
    
    completionBlock(user1, error);
}


@end
