//
//  DataManager.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Expansion.h"
#import "Hero.h"
#import "HenchmanGroup.h"
#import "VillainGroup.h"
#import "Mastermind.h"
#import "DisplayableEntity.h"
#import "EnemyGroup.h"
#import "Scheme.h"
#import "SchemeRule.h"

@interface DataManager : NSObject

+ (instancetype) sharedInstance;

@property (strong) NSManagedObjectContext *managedObjectContext;

- (NSArray *) fetchAllSchemes;
- (NSArray *) fetchAllMasterminds;
- (NSArray *) fetchAllVillainGroups;
- (NSArray *) fetchAllHenchmanGroups;
- (NSArray *) fetchAllHeroes;
- (NSArray *) fetchAllEnemyGroups;

- (NSArray *) fetchAllNotBannedSchemes;
- (NSArray *) fetchAllNotBannedMasterminds;
- (NSArray *) fetchAllNotBannedVillainGroups;
- (NSArray *) fetchAllNotBannedHenchmanGroups;
- (NSArray *) fetchAllNotBannedHeroes;
- (NSArray *) fetchAllNotBannedEnemyGroups;

- (NSArray *) fetchAllBannedSchemes;
- (NSArray *) fetchAllBannedMasterminds;
- (NSArray *) fetchAllBannedVillainGroups;
- (NSArray *) fetchAllBannedHenchmanGroups;
- (NSArray *) fetchAllBannedHeroes;
- (NSArray *) fetchAllBannedEnemyGroups;

- (NSArray *) fetchAllExpansions;

@end
