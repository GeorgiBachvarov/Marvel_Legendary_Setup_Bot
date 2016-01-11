//
//  Scheme+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Scheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scheme (CoreDataProperties)

@property (nullable, nonatomic, retain) Expansion *expansion;
@property (nullable, nonatomic, retain) NSSet<SchemeRule *> *rules;

@end

@interface Scheme (CoreDataGeneratedAccessors)

- (void)addRulesObject:(SchemeRule *)value;
- (void)removeRulesObject:(SchemeRule *)value;
- (void)addRules:(NSSet<SchemeRule *> *)values;
- (void)removeRules:(NSSet<SchemeRule *> *)values;

@end

NS_ASSUME_NONNULL_END
