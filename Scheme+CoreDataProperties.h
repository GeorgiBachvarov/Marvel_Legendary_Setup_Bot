//
//  Scheme+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Scheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scheme (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *extraHenchmanGroups;
@property (nullable, nonatomic, retain) NSNumber *extraVillainGroups;
@property (nullable, nonatomic, retain) NSManagedObject *expansion;
@property (nullable, nonatomic, retain) NSSet<EnemyGroup *> *mandatoryEnemyGroups;

@end

@interface Scheme (CoreDataGeneratedAccessors)

- (void)addMandatoryEnemyGroupsObject:(EnemyGroup *)value;
- (void)removeMandatoryEnemyGroupsObject:(EnemyGroup *)value;
- (void)addMandatoryEnemyGroups:(NSSet<EnemyGroup *> *)values;
- (void)removeMandatoryEnemyGroups:(NSSet<EnemyGroup *> *)values;

@end

NS_ASSUME_NONNULL_END
