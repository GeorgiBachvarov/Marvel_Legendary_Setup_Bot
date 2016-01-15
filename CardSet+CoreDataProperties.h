//
//  CardSet+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CardSet.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardSet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<SchemeRule *> *partOfSchemeRules;

@end

@interface CardSet (CoreDataGeneratedAccessors)

- (void)addPartOfSchemeRulesObject:(SchemeRule *)value;
- (void)removePartOfSchemeRulesObject:(SchemeRule *)value;
- (void)addPartOfSchemeRules:(NSSet<SchemeRule *> *)values;
- (void)removePartOfSchemeRules:(NSSet<SchemeRule *> *)values;

@end

NS_ASSUME_NONNULL_END
