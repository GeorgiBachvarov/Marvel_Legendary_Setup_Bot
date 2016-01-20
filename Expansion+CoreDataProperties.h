//
//  Expansion+CoreDataProperties.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Expansion.h"

NS_ASSUME_NONNULL_BEGIN

@interface Expansion (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *isOwned;
@property (nullable, nonatomic, retain) NSDate *releaseDate;
@property (nullable, nonatomic, retain) NSSet<HenchmanGroup *> *henchmanGroups;
@property (nullable, nonatomic, retain) NSSet<Hero *> *heroes;
@property (nullable, nonatomic, retain) NSSet<Mastermind *> *masterminds;
@property (nullable, nonatomic, retain) NSSet<Scheme *> *schemes;
@property (nullable, nonatomic, retain) NSSet<VillainGroup *> *villainGroups;

@end

@interface Expansion (CoreDataGeneratedAccessors)

- (void)addHenchmanGroupsObject:(HenchmanGroup *)value;
- (void)removeHenchmanGroupsObject:(HenchmanGroup *)value;
- (void)addHenchmanGroups:(NSSet<HenchmanGroup *> *)values;
- (void)removeHenchmanGroups:(NSSet<HenchmanGroup *> *)values;

- (void)addHeroesObject:(Hero *)value;
- (void)removeHeroesObject:(Hero *)value;
- (void)addHeroes:(NSSet<Hero *> *)values;
- (void)removeHeroes:(NSSet<Hero *> *)values;

- (void)addMastermindsObject:(Mastermind *)value;
- (void)removeMastermindsObject:(Mastermind *)value;
- (void)addMasterminds:(NSSet<Mastermind *> *)values;
- (void)removeMasterminds:(NSSet<Mastermind *> *)values;

- (void)addSchemesObject:(Scheme *)value;
- (void)removeSchemesObject:(Scheme *)value;
- (void)addSchemes:(NSSet<Scheme *> *)values;
- (void)removeSchemes:(NSSet<Scheme *> *)values;

- (void)addVillainGroupsObject:(VillainGroup *)value;
- (void)removeVillainGroupsObject:(VillainGroup *)value;
- (void)addVillainGroups:(NSSet<VillainGroup *> *)values;
- (void)removeVillainGroups:(NSSet<VillainGroup *> *)values;

@end

NS_ASSUME_NONNULL_END
