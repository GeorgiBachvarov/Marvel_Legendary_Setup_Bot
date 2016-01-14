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

@implementation GameCreator

+ (void)createGameForPlayers:(NSInteger)numberOfPlayers callback:(GameCreatorCallbackBlock)callback{
    NSInteger numberOfVillainGroups = [self numberOfVillainGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHenchmanGroups = [self numberOfHenchmanGroupsForPlayers:numberOfPlayers];
    NSInteger numberOfHeroes = [self numberOfHeroesForPlayers:numberOfPlayers];
    
    Scheme *scheme = [[[DataManager sharedInstance] fetchAllSchemes] randomObject];
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
