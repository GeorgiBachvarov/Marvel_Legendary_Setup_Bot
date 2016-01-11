//
//  DisplayableEntity.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "DisplayableEntity.h"
#import "DataManager.h"

@implementation DisplayableEntity

- (instancetype)initWithDisplayName:(NSString *)displayName{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass(self.class) inManagedObjectContext:[[DataManager sharedInstance] managedObjectContext]];
    
    self = [self initWithEntity:entityDescription insertIntoManagedObjectContext:[[DataManager sharedInstance] managedObjectContext]];
    
    return self;
}

- (instancetype)initWithDisplayName:(NSString *)displayName insertIntoExpansion:(Expansion *)expansion{
    self = [self initWithDisplayName:displayName];
    if (self) {
        if ([self respondsToSelector:@selector(setExpansion:)]){
            [self performSelector:@selector(setExpansion:) withObject:expansion];
        }
    }
    return self;
}

@end
