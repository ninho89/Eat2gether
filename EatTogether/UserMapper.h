//
//  UserMapper.h
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserMapper : NSObject

- (User *)mapParseUser:(PFUser *)pfUser;

@end
