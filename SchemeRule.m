//
//  SchemeRule.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "SchemeRule.h"
#import "Scheme.h"
#import "DataManager.h"

@implementation SchemeRule

- (instancetype)init{
    self = [super initWithEntity:[NSEntityDescription entityForName:NSStringFromClass(self.class) inManagedObjectContext:[[DataManager sharedInstance] managedObjectContext]] insertIntoManagedObjectContext:[[DataManager sharedInstance] managedObjectContext]];
    return self;
}

@end
