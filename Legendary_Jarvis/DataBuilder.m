//
//  DataBuilder.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "DataBuilder.h"
#import "DataManager.h"

@implementation DataBuilder

+ (void)buildLegendaryData{
    NSManagedObjectContext *ctx = [[DataManager sharedInstance] managedObjectContext];

    
    //build expansions one by one
    
    
    
    
#pragma mark Basic Set
    
    //init all data
    Expansion *basicSet = [[Expansion alloc] initWithDisplayName:@"Basic Set"];
    
    Scheme *scheme1 = [[Scheme alloc] initWithDisplayName:@"The Legacy Virus"];
    Scheme *scheme2 = [[Scheme alloc] initWithDisplayName:@"Midtown Bank Robbery"];
    Scheme *scheme3 = [[Scheme alloc] initWithDisplayName:@"Negative Zone Prizon Breakout"];
    Scheme *scheme4 = [[Scheme alloc] initWithDisplayName:@"Portals to the Dark Dimension"];
    Scheme *scheme5 = [[Scheme alloc] initWithDisplayName:@"Replace Earth's Leaders with Killbots"];
    Scheme *scheme6 = [[Scheme alloc] initWithDisplayName:@"Secret Invasion of the Skrull Shapeshifters"];
    Scheme *scheme7 = [[Scheme alloc] initWithDisplayName:@"Super Hero Civil War"];
    Scheme *scheme8 = [[Scheme alloc] initWithDisplayName:@"Unleash the Power of the Cosmic Cube"];
    
    Mastermind *mastermind1 = [[Mastermind alloc] initWithDisplayName:@"Red Skull"];
    Mastermind *mastermind2 = [[Mastermind alloc] initWithDisplayName:@"Magneto"];
    Mastermind *mastermind3 = [[Mastermind alloc] initWithDisplayName:@"Dr. Doom"];
    Mastermind *mastermind4 = [[Mastermind alloc] initWithDisplayName:@"Loki"];
    
    VillainGroup *villainGroup1 = [[VillainGroup alloc] initWithDisplayName:@"Brotherhood"];
    VillainGroup *villainGroup2 = [[VillainGroup alloc] initWithDisplayName:@"Enemies of Asgard"];
    VillainGroup *villainGroup3 = [[VillainGroup alloc] initWithDisplayName:@"HYDRA"];
    VillainGroup *villainGroup4 = [[VillainGroup alloc] initWithDisplayName:@"Masters of Evil"];
    VillainGroup *villainGroup5 = [[VillainGroup alloc] initWithDisplayName:@"Radiation"];
    VillainGroup *villainGroup6 = [[VillainGroup alloc] initWithDisplayName:@"Skrulls"];
    VillainGroup *villainGroup7 = [[VillainGroup alloc] initWithDisplayName:@"Spider Foes"];
    
    HenchmanGroup *henchmanGroup1 = [[HenchmanGroup alloc] initWithDisplayName:@"Doombot Legion"];
    HenchmanGroup *henchmanGroup2 = [[HenchmanGroup alloc] initWithDisplayName:@"Hand Ninjas"];
    HenchmanGroup *henchmanGroup3 = [[HenchmanGroup alloc] initWithDisplayName:@"Savage Land Mutates"];
    HenchmanGroup *henchmanGroup4 = [[HenchmanGroup alloc] initWithDisplayName:@"Sentinels"];
    
    Hero *hero1 = [[Hero alloc] initWithDisplayName:@"Black Widow"];
    Hero *hero2 = [[Hero alloc] initWithDisplayName:@"Captain America"];
    Hero *hero3 = [[Hero alloc] initWithDisplayName:@"Cyclops"];
    Hero *hero4 = [[Hero alloc] initWithDisplayName:@"Deadpool"];
    Hero *hero5 = [[Hero alloc] initWithDisplayName:@"Emma Frost"];
    Hero *hero6 = [[Hero alloc] initWithDisplayName:@"Gambit"];
    Hero *hero7 = [[Hero alloc] initWithDisplayName:@"Hawkeye"];
    Hero *hero8 = [[Hero alloc] initWithDisplayName:@"Hulk"];
    Hero *hero9 = [[Hero alloc] initWithDisplayName:@"Iron Man"];
    Hero *hero10 = [[Hero alloc] initWithDisplayName:@"Nick Fury"];
    Hero *hero11 = [[Hero alloc] initWithDisplayName:@"Rogue"];
    Hero *hero12 = [[Hero alloc] initWithDisplayName:@"Spider-Man"];
    Hero *hero13 = [[Hero alloc] initWithDisplayName:@"Storm"];
    Hero *hero14 = [[Hero alloc] initWithDisplayName:@"Thor"];
    Hero *hero15 = [[Hero alloc] initWithDisplayName:@"Wolverine"];
    
    //make necessary connections
    [mastermind1 addAlwaysLeadsObject:villainGroup3];
    [mastermind2 addAlwaysLeadsObject:villainGroup1];
    [mastermind3 addAlwaysLeadsObject:henchmanGroup1];
    [mastermind4 addAlwaysLeadsObject:villainGroup2];
    
    scheme3.extraHenchmanGroups = @(1);
    
    
#pragma mark Dark City
    

#pragma mark Secret Wars Vol 1
    
    
}

@end
