//
//  DisplayableEntity+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DisplayableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayableEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *displayName;
@property (nullable, nonatomic, retain) NSNumber *isVetoed;

@end

NS_ASSUME_NONNULL_END
