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
    
    NSMutableArray *schemeBank = [[[DataManager sharedInstance] fetchAllNotBannedSchemes] mutableCopy];
    NSMutableArray *mastermindBank = [[[DataManager sharedInstance] fetchAllNotBannedMasterminds] mutableCopy];
    NSMutableArray *heroesBank = [[[DataManager sharedInstance] fetchAllNotBannedHeroes] mutableCopy];
    NSMutableArray *villainGroupBank = [[[DataManager sharedInstance] fetchAllNotBannedVillainGroups] mutableCopy];
    NSMutableArray *henchmanGroupBank = [[[DataManager sharedInstance] fetchAllNotBannedHenchmanGroups] mutableCopy];
    
    NSInteger numberOfVillainGroups = [self numberOfVillainGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHenchmanGroups = [self numberOfHenchmanGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHeroes = [self numberOfHeroesForPlayers:numberOfPlayers];
    
    NSMutableArray *villainDeckSets = [NSMutableArray array];
    NSMutableArray *heroDeckSets = [NSMutableArray array];
    Mastermind *mastermind;
    Scheme *scheme;
    
    
    scheme = [schemeBank randomObject];
//    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Scheme"];
//    [fr setPredicate:[NSPredicate predicateWithFormat:@"displayName == %@",@"Save Humanity"]];
//    scheme = [[[[DataManager sharedInstance] managedObjectContext] executeFetchRequest:fr error:nil] firstObject];
    
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
                
                if (rule.objects.count) {
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
                
                if (rule.objects.count) {
                    [villainDeckSets addObjectsFromArray:rule.objects.allObjects];
                    [mastermindBank removeObjectsInArray:rule.objects.allObjects];
                }else{
                    for (NSInteger villainMastermindsCounter = 0; villainMastermindsCounter < rule.objectCount.integerValue; villainMastermindsCounter++) {
                        [villainDeckSets addObject:[mastermindBank removeRandomObject]];
                    }
                }
                
                break;
            }
            case SchemeRuleTypeAddSpecificVillainGroupToVillainDeck:{
                
                if (rule.objects.count) {
                    [villainDeckSets addObjectsFromArray:rule.objects.allObjects];
                    [villainGroupBank removeObjectsInArray:rule.objects.allObjects];
                }
                
                break;
            }
            case SchemeRuleTypeSetNumberOfHeroes:{
                
                numberOfHeroes = rule.objectCount.integerValue;
                
                break;
            }
                
            default:
                break;
        }
    }
    
    //fill in the rest as normal
    
    if (!mastermind) {
        mastermind = [mastermindBank removeRandomObject];
        
        if (numberOfHenchmanGroups + numberOfVillainGroups) {
            for (CardSet *alwaysLeadSet in mastermind.alwaysLeads.allObjects) {
                if ([alwaysLeadSet isKindOfClass:[Mastermind class]]) {
                    [mastermindBank removeObject:alwaysLeadSet];
                    [villainDeckSets addObject:alwaysLeadSet];
                }else if ([alwaysLeadSet isKindOfClass:[VillainGroup class]]) {
                    [villainGroupBank removeObject:alwaysLeadSet];
                    [villainDeckSets addObject:alwaysLeadSet];
                    numberOfVillainGroups--;
                }else if ([alwaysLeadSet isKindOfClass:[HenchmanGroup class]]){
                    [henchmanGroupBank removeObject:alwaysLeadSet];
                    [villainDeckSets addObject:alwaysLeadSet];
                    numberOfHenchmanGroups--;
                }
            }
        }
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
