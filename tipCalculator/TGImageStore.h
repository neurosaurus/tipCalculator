//
//  TGImageStore.h
//  tipCalculator
//
//  Created by Tripta Gupta on 2/25/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

//- (void)setImage:(UIImage *)image forKey:(NSString *)key
//{
//    [self.dictionary setObject:image forKey:key];
//}

//- (UIImage *)imageforKey:

@end
