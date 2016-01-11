//
//  EnemyGroup+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EnemyGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface EnemyGroup (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *alwaysLeadBy;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *alwaysInSchemes;

@end

@interface EnemyGroup (CoreDataGeneratedAccessors)

- (void)addAlwaysLeadByObject:(NSManagedObject *)value;
- (void)removeAlwaysLeadByObject:(NSManagedObject *)value;
- (void)addAlwaysLeadBy:(NSSet<NSManagedObject *> *)values;
- (void)removeAlwaysLeadBy:(NSSet<NSManagedObject *> *)values;

- (void)addAlwaysInSchemesObject:(NSManagedObject *)value;
- (void)removeAlwaysInSchemesObject:(NSManagedObject *)value;
- (void)addAlwaysInSchemes:(NSSet<NSManagedObject *> *)values;
- (void)removeAlwaysInSchemes:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
