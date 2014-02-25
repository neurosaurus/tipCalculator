//
//  TGImageStore.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/25/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TGImageStore.h"

@interface TGImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end


@implementation TGImageStore

+ (instancetype)sharedStore
{
    static TGImageStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [TGImageStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }

    return self;
}

@end
