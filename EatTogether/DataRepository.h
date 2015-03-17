//
//  DataRepository.h
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataRepository <NSObject>

-(void) getCitiesWithCompletionBlock:^(NSArray *cities, NSError *error);

@end