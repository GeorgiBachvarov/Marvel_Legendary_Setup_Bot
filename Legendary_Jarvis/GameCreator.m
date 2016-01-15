//
//  GameCreator.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/14/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "GameCreator.h"
#import "DataManager.h"
#import "NSArray+Randomness.h"
#import "NSMutableArray+Randomness.h"
#import "HenchmanGroup.h"
#import "VillainGroup.h"
#import "Hero.h"

@implementation GameCreator

+ (void)createGameForPlayers:(NSInteger)numberOfPlayers callback:(GameCreatorCallbackBlock)callback{
    
    NSMutableArray *schemeBank = [[[DataManager sharedInstance] fetchAllSchemes] mutableCopy];
    NSMutableArray *mastermindBank = [[[DataManager sharedInstance] fetchAllMasterminds] mutableCopy];
    NSMutableArray *heroesBank = [[[DataManager sharedInstance] fetchAllHeroes] mutableCopy];
    NSMutableArray *villainGroupBank = [[[DataManager sharedInstance] fetchAllVillainGroups] mutableCopy];
    NSMutableArray *henchmanGroupBank = [[[DataManager sharedInstance] fetchAllHenchmanGroups] mutableCopy];
    
    NSInteger numberOfVillainGroups = [self numberOfVillainGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHenchmanGroups = [self numberOfHenchmanGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHeroes = [self numberOfHeroesForPlayers:numberOfPlayers];
    
    NSMutableArray *villainDeckSets = [NSMutableArray array];
    NSMutableArray *heroDeckSets = [NSMutableArray array];
    Mastermind *mastermind;
    Scheme *scheme;
    
    
    scheme = [schemeBank randomObject];
    
    //apply scheme rules to setup first
    
    for (SchemeRule *rule in scheme.rules) {
        switch ([rule.ruleType integerValue]) {
            case SchemeRuleTypeAddExtraHenchmanGroupToVillainDeck:{
                
                numberOfHenchmanGroups += rule.objectCount.integerValue;
                
                for (HenchmanGroup *group in rule.objects) {
                    [villainDeckSets addObject:group];
                    [henchmanGroupBank removeObject:group];
                    numberOfHenchmanGroups--;
                }
                
                break;
            }
            case SchemeRuleTypeAddExtraVillainGroupToVillainDeck:{
                
                numberOfVillainGroups += rule.objectCount.integerValue;
                
                for (VillainGroup *group in rule.objects) {
                    [villainDeckSets addObject:group];
                    [villainGroupBank removeObject:group];
                    numberOfVillainGroups--;
                }
                
                break;
            }
            case SchemeRuleTypeAddExtraHeroToVillainDeck:{
                
                if (rule.objects) {
                    [villainDeckSets addObjectsFromArray:rule.objects.allObjects];
                    [heroesBank removeObjectsInArray:rule.objects.allObjects];
                }else{
                    for (NSInteger villainHeroesCounter = 0; villainHeroesCounter < rule.objectCount.integerValue; villainHeroesCounter++) {
                        [villainDeckSets addObject:[heroesBank removeRandomObject]];
                    }
                }
                
                break;
            }
            case SchemeRuleTypeAddExtraMastermindToVillainDeck:{
                
                if (rule.objects) {
                    [villainDeckSets addObjectsFromArray:rule.objects.allObjects];
                    [mastermindBank removeObjectsInArray:rule.objects.allObjects];
                }else{
                    for (NSInteger villainMastermindsCounter = 0; villainMastermindsCounter < rule.objectCount.integerValue; villainMastermindsCounter++) {
                        [villainDeckSets addObject:[mastermindBank removeRandomObject]];
                    }
                }
                
                break;
            }
            case SchemeRuleTypeSetNumberOfHeroes:{
                
                numberOfHeroes += rule.objectCount.integerValue;
                
                break;
            }
                
            default:
                break;
        }
    }
    
    //fill in the rest as normal
    
    if (!mastermind) {
        mastermind = [mastermindBank removeRandomObject];
    }
    
    for (NSInteger remainingVillaingGroupsCounter = 0; remainingVillaingGroupsCounter < numberOfVillainGroups; remainingVillaingGroupsCounter++) {
        [villainDeckSets addObject:[villainGroupBank removeRandomObject]];
    }
    
    for (NSInteger remainingHenchmanGroupsCounter = 0; remainingHenchmanGroupsCounter < numberOfHenchmanGroups; remainingHenchmanGroupsCounter++) {
        [villainDeckSets addObject:[henchmanGroupBank removeRandomObject]];
    }
    
    for (NSInteger remainingHeroesCounter = 0; remainingHeroesCounter < numberOfHeroes; remainingHeroesCounter++) {
        [heroDeckSets addObject:[heroesBank removeRandomObject]];
    }
    
    if (callback) {
        callback(villainDeckSets, heroDeckSets, scheme, mastermind);
    }
}

+ (NSInteger) numberOfVillainGroupsForPlayers:(NSInteger) numberOfPlayers{
    switch (numberOfPlayers) {
        case 2:
            return 2;
        case 3:
            return 3;
        case 4:
            return 3;
        case 5:
            return 4;
        default:
            return 0;
    }
}

+ (NSInteger) numberOfHenchmanGroupsForPlayers:(NSInteger) numberOfPlayers{
    switch (numberOfPlayers) {
        case 2:
            return 1;
        case 3:
            return 1;
        case 4:
            return 2;
        case 5:
            return 2;
        default:
            return 0;
    }
}

+ (NSInteger) numberOfHeroesForPlayers:(NSInteger) numberOfPlayers{
    switch (numberOfPlayers) {
        case 2:
            return 5;
        case 3:
            return 5;
        case 4:
            return 5;
        case 5:
            return 6;
        default:
            return 0;
    }
}

@end
