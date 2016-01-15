//
//  NSMutableArray+Randomness.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/15/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "NSMutableArray+Randomness.h"
#import "NSArray+Randomness.h"

@implementation NSMutableArray (Randomness)

- (id)removeRandomObject{
    id object = [self randomObject];
    [self removeObject:object];
    return object;
}

@end
