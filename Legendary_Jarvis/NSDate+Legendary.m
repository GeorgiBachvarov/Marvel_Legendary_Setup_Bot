//
//  NSDate+Legendary.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/20/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "NSDate+Legendary.h"

@implementation NSDate (Legendary)

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    
    self  = [self init];
    if (self){
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.year = year;
        components.month = month;
        components.day = day;
        components.timeZone = [NSTimeZone timeZoneWithName:@"America/New_York"];
        self = [calendar dateFromComponents:components];
    }
    
    
    return self;
}

@end
