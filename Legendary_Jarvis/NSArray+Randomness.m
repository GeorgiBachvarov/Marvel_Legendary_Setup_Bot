//
//  NSArray+Randomness.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/14/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "NSArray+Randomness.h"

@implementation NSArray (Randomness)

- (id)randomObject{
    NSInteger randomIndexInArray = rand() % self.count;
    return [self objectAtIndex:randomIndexInArray];
}

@end
