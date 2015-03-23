//
//  PMBlockDebouncer.m
//  PlexMobile
//
//  Created by Sergio Padrino on 26/11/14.
//  Copyright (c) 2014 Plex Inc. All rights reserved.
//

#import "PMKBlockDebouncer.h"

static NSTimeInterval const kPMBlockDebouncerDefaultDelay = 0.5;

@interface PMKBlockDebouncer ()

@property (nonatomic) BOOL hasBlockPending;

@end

@implementation PMKBlockDebouncer

- (id)init
{
    self = [super init];
    if (self) {
        _delay = kPMBlockDebouncerDefaultDelay;
    }
    return self;
}

- (void)dismissBlock
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    self.hasBlockPending = NO;
}

- (void)callBlock:(dispatch_block_t)block
{
    [self dismissBlock];
    
    self.hasBlockPending = YES;
    
    [self performSelector:@selector(actuallyCallBlock:) withObject:block afterDelay:self.delay];
}

- (void)actuallyCallBlock:(dispatch_block_t)block
{
    BOOL shouldInvokeBlock = (self.conditionBlock == nil || self.conditionBlock());
    
    if (shouldInvokeBlock)
    {
        block();
        
        self.hasBlockPending = NO;
    }
    else
    {
        [self callBlock:block];
    }
}

@end
