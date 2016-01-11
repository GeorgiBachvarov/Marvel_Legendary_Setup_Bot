//
//  EnemyGroup+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EnemyGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface EnemyGroup (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<Mastermind *> *alwaysLeadBy;

@end

@interface EnemyGroup (CoreDataGeneratedAccessors)

- (void)addAlwaysLeadByObject:(Mastermind *)value;
- (void)removeAlwaysLeadByObject:(Mastermind *)value;
- (void)addAlwaysLeadBy:(NSSet<Mastermind *> *)values;
- (void)removeAlwaysLeadBy:(NSSet<Mastermind *> *)values;

@end

NS_ASSUME_NONNULL_END
