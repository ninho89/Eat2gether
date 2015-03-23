//
//  PMBlockDebouncer.h
//  PlexMobile
//
//  Created by Sergio Padrino on 26/11/14.
//  Copyright (c) 2014 Plex Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^PMKBlockDebouncerConditionBlock)(void);

@interface PMKBlockDebouncer : NSObject

@property (nonatomic) NSTimeInterval delay;
@property (nonatomic, readonly) BOOL hasBlockPending;
@property (nonatomic, strong) PMKBlockDebouncerConditionBlock conditionBlock;

- (void)dismissBlock;
- (void)callBlock:(dispatch_block_t)block;

@end
