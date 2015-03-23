//
//  UserMapper.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserMapper.h"

@implementation UserMapper

- (User *)mapParseUser:(PFUser *)pfUser{
    
    User *user = [[User alloc] init];
    user.userObjectId = [pfUser valueForKey:@"objectId"];
    user.username = [pfUser valueForKey:@"username"];
    user.email = [pfUser valueForKey:@"email"];
    PFFile *imageFile = [pfUser objectForKey:@"userPicture"];
    user.userPicture = imageFile.url;
    
    return user;
}

@end
