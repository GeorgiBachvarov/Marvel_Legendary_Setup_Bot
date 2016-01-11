//
//  DisplayableEntity.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisplayableEntity : NSManagedObject

- (instancetype)initWithDisplayName:(NSString *) displayName;

@end

NS_ASSUME_NONNULL_END

#import "DisplayableEntity+CoreDataProperties.h"
