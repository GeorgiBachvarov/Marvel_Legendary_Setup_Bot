//
//  Mastermind+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Mastermind.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mastermind (CoreDataProperties)

@property (nullable, nonatomic, retain) NSManagedObject *expansion;
@property (nullable, nonatomic, retain) NSSet<EnemyGroup *> *alwaysLeads;

@end

@interface Mastermind (CoreDataGeneratedAccessors)

- (void)addAlwaysLeadsObject:(EnemyGroup *)value;
- (void)removeAlwaysLeadsObject:(EnemyGroup *)value;
- (void)addAlwaysLeads:(NSSet<EnemyGroup *> *)values;
- (void)removeAlwaysLeads:(NSSet<EnemyGroup *> *)values;

@end

NS_ASSUME_NONNULL_END
