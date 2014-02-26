//
//  TGImageStore.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/25/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TRPImageStore.h"

@interface TRPImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end


@implementation TRPImageStore

+ (instancetype)sharedStore
{
    static TRPImageStore *sharedStore = nil;
    
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

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageforKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
