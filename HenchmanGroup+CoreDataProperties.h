//
//  HenchmanGroup+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "HenchmanGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface HenchmanGroup (CoreDataProperties)

@property (nullable, nonatomic, retain) Expansion *expansion;

@end

NS_ASSUME_NONNULL_END
