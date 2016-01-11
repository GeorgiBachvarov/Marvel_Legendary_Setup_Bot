//
//  SchemeRule+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SchemeRule.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchemeRule (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *ruleType;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *objects; //use for specific objects
@property (nullable, nonatomic, retain) Scheme *scheme;
@property (nullable, nonatomic, retain) NSNumber *objectCount; //use for random objects

@end

@interface SchemeRule (CoreDataGeneratedAccessors)

- (void)addObjectsObject:(NSManagedObject *)value;
- (void)removeObjectsObject:(NSManagedObject *)value;
- (void)addObjects:(NSSet<NSManagedObject *> *)values;
- (void)removeObjects:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
