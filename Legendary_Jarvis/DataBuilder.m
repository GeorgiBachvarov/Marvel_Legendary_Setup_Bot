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
    
    Scheme *scheme1_1 = [[Scheme alloc] initWithDisplayName:@"The Legacy Virus" insertIntoExpansion:basicSet];
    Scheme *scheme1_2 = [[Scheme alloc] initWithDisplayName:@"Midtown Bank Robbery" insertIntoExpansion:basicSet];
    Scheme *scheme1_3 = [[Scheme alloc] initWithDisplayName:@"Negative Zone Prizon Breakout" insertIntoExpansion:basicSet];
    Scheme *scheme1_4 = [[Scheme alloc] initWithDisplayName:@"Portals to the Dark Dimension" insertIntoExpansion:basicSet];
    Scheme *scheme1_5 = [[Scheme alloc] initWithDisplayName:@"Replace Earth's Leaders with Killbots"];
    Scheme *scheme1_6 = [[Scheme alloc] initWithDisplayName:@"Secret Invasion of the Skrull Shapeshifters"];
    Scheme *scheme1_7 = [[Scheme alloc] initWithDisplayName:@"Super Hero Civil War"];
    Scheme *scheme1_8 = [[Scheme alloc] initWithDisplayName:@"Unleash the Power of the Cosmic Cube"];
    
    Mastermind *mastermind1_1 = [[Mastermind alloc] initWithDisplayName:@"Red Skull"];
    Mastermind *mastermind1_2 = [[Mastermind alloc] initWithDisplayName:@"Magneto"];
    Mastermind *mastermind1_3 = [[Mastermind alloc] initWithDisplayName:@"Dr. Doom"];
    Mastermind *mastermind1_4 = [[Mastermind alloc] initWithDisplayName:@"Loki"];
    
    VillainGroup *villainGroup1_1 = [[VillainGroup alloc] initWithDisplayName:@"Brotherhood"];
    VillainGroup *villainGroup1_2 = [[VillainGroup alloc] initWithDisplayName:@"Enemies of Asgard"];
    VillainGroup *villainGroup1_3 = [[VillainGroup alloc] initWithDisplayName:@"HYDRA"];
    VillainGroup *villainGroup1_4 = [[VillainGroup alloc] initWithDisplayName:@"Masters of Evil"];
    VillainGroup *villainGroup1_5 = [[VillainGroup alloc] initWithDisplayName:@"Radiation"];
    VillainGroup *villainGroup1_6 = [[VillainGroup alloc] initWithDisplayName:@"Skrulls"];
    VillainGroup *villainGroup1_7 = [[VillainGroup alloc] initWithDisplayName:@"Spider Foes"];
    
    HenchmanGroup *henchmanGroup1_1 = [[HenchmanGroup alloc] initWithDisplayName:@"Doombot Legion"];
    HenchmanGroup *henchmanGroup1_2 = [[HenchmanGroup alloc] initWithDisplayName:@"Hand Ninjas"];
    HenchmanGroup *henchmanGroup1_3 = [[HenchmanGroup alloc] initWithDisplayName:@"Savage Land Mutates"];
    HenchmanGroup *henchmanGroup1_4 = [[HenchmanGroup alloc] initWithDisplayName:@"Sentinels"];
    
    Hero *hero1_1 = [[Hero alloc] initWithDisplayName:@"Black Widow"];
    Hero *hero1_2 = [[Hero alloc] initWithDisplayName:@"Captain America"];
    Hero *hero1_3 = [[Hero alloc] initWithDisplayName:@"Cyclops"];
    Hero *hero1_4 = [[Hero alloc] initWithDisplayName:@"Deadpool"];
    Hero *hero1_5 = [[Hero alloc] initWithDisplayName:@"Emma Frost"];
    Hero *hero1_6 = [[Hero alloc] initWithDisplayName:@"Gambit"];
    Hero *hero1_7 = [[Hero alloc] initWithDisplayName:@"Hawkeye"];
    Hero *hero1_8 = [[Hero alloc] initWithDisplayName:@"Hulk"];
    Hero *hero1_9 = [[Hero alloc] initWithDisplayName:@"Iron Man"];
    Hero *hero1_10 = [[Hero alloc] initWithDisplayName:@"Nick Fury"];
    Hero *hero1_11 = [[Hero alloc] initWithDisplayName:@"Rogue"];
    Hero *hero1_12 = [[Hero alloc] initWithDisplayName:@"Spider-Man"];
    Hero *hero1_13 = [[Hero alloc] initWithDisplayName:@"Storm"];
    Hero *hero1_14 = [[Hero alloc] initWithDisplayName:@"Thor"];
    Hero *hero1_15 = [[Hero alloc] initWithDisplayName:@"Wolverine"];
    
    //make necessary connections
    [mastermind1_1 addAlwaysLeadsObject:villainGroup1_3];
    [mastermind1_2 addAlwaysLeadsObject:villainGroup1_1];
    [mastermind1_3 addAlwaysLeadsObject:henchmanGroup1_1];
    [mastermind1_4 addAlwaysLeadsObject:villainGroup1_2];
    
    SchemeRule *rule1_1 = [[SchemeRule alloc] init];
    rule1_1.ruleType = @(SchemeRuleTypeAddExtraHenchmanGroupToVillainDeck);
    rule1_1.objectCount = @(1);
    [scheme1_3 addRulesObject:rule1_1];

    
    
#pragma mark Dark City
    
    //init all data
    Expansion *darkCity = [[Expansion alloc] initWithDisplayName:@"Dark City"];
    
    Scheme *scheme2_1 = [[Scheme alloc] initWithDisplayName:@"Capture Baby Hope" insertIntoExpansion:darkCity];
    Scheme *scheme2_2 = [[Scheme alloc] initWithDisplayName:@"Detonate the Helicarrier" insertIntoExpansion:darkCity];
    Scheme *scheme2_3 = [[Scheme alloc] initWithDisplayName:@"Massive Earthquake Generator" insertIntoExpansion:darkCity];
    Scheme *scheme2_4 = [[Scheme alloc] initWithDisplayName:@"Organized Crimewave" insertIntoExpansion:darkCity];
    Scheme *scheme2_5 = [[Scheme alloc] initWithDisplayName:@"Save Humanity" insertIntoExpansion:darkCity];
    Scheme *scheme2_6 = [[Scheme alloc] initWithDisplayName:@"Steal the Weaponized Plutonium" insertIntoExpansion:darkCity];
    Scheme *scheme2_7 = [[Scheme alloc] initWithDisplayName:@"Transform Citizens into Demons" insertIntoExpansion:darkCity];
    Scheme *scheme2_8 = [[Scheme alloc] initWithDisplayName:@"X-Cutioner's Song" insertIntoExpansion:darkCity];
    
    Mastermind *mastermind2_1 = [[Mastermind alloc] initWithDisplayName:@"Apocalypse" insertIntoExpansion:darkCity];
    Mastermind *mastermind2_2 = [[Mastermind alloc] initWithDisplayName:@"Kingpin" insertIntoExpansion:darkCity];
    Mastermind *mastermind2_3 = [[Mastermind alloc] initWithDisplayName:@"Mephisto" insertIntoExpansion:darkCity];
    Mastermind *mastermind2_4 = [[Mastermind alloc] initWithDisplayName:@"Mr. Sinister" insertIntoExpansion:darkCity];
    Mastermind *mastermind2_5 = [[Mastermind alloc] initWithDisplayName:@"Stryfe" insertIntoExpansion:darkCity];
    
    VillainGroup *villainGroup2_1 = [[VillainGroup alloc] initWithDisplayName:@"Emissaries of Evil" insertIntoExpansion:darkCity];
    VillainGroup *villainGroup2_2 = [[VillainGroup alloc] initWithDisplayName:@"Four Horsemen" insertIntoExpansion:darkCity];
    VillainGroup *villainGroup2_3 = [[VillainGroup alloc] initWithDisplayName:@"Marauders" insertIntoExpansion:darkCity];
    VillainGroup *villainGroup2_4 = [[VillainGroup alloc] initWithDisplayName:@"MLF" insertIntoExpansion:darkCity];
    VillainGroup *villainGroup2_5 = [[VillainGroup alloc] initWithDisplayName:@"Streets of New York" insertIntoExpansion:darkCity];
    VillainGroup *villainGroup2_6 = [[VillainGroup alloc] initWithDisplayName:@"Underworld" insertIntoExpansion:darkCity];
    
    HenchmanGroup *henchmanGroup2_1 = [[HenchmanGroup alloc] initWithDisplayName:@"Maggia Goons" insertIntoExpansion:darkCity];
    HenchmanGroup *henchmanGroup2_2 = [[HenchmanGroup alloc] initWithDisplayName:@"Phalanx" insertIntoExpansion:darkCity];
    
    Hero *hero2_1 = [[Hero alloc] initWithDisplayName:@"Angel" insertIntoExpansion:darkCity];
    Hero *hero2_2 = [[Hero alloc] initWithDisplayName:@"Bishop" insertIntoExpansion:darkCity];
    Hero *hero2_3 = [[Hero alloc] initWithDisplayName:@"Blade" insertIntoExpansion:darkCity];
    Hero *hero2_4 = [[Hero alloc] initWithDisplayName:@"Cable" insertIntoExpansion:darkCity];
    Hero *hero2_5 = [[Hero alloc] initWithDisplayName:@"Colossus" insertIntoExpansion:darkCity];
    Hero *hero2_6 = [[Hero alloc] initWithDisplayName:@"Daredevil" insertIntoExpansion:darkCity];
    Hero *hero2_7 = [[Hero alloc] initWithDisplayName:@"Domino" insertIntoExpansion:darkCity];
    Hero *hero2_8 = [[Hero alloc] initWithDisplayName:@"Elektra" insertIntoExpansion:darkCity];
    Hero *hero2_9 = [[Hero alloc] initWithDisplayName:@"Forge" insertIntoExpansion:darkCity];
    Hero *hero2_10 = [[Hero alloc] initWithDisplayName:@"Ghost Rider" insertIntoExpansion:darkCity];
    Hero *hero2_11 = [[Hero alloc] initWithDisplayName:@"Iceman" insertIntoExpansion:darkCity];
    Hero *hero2_12 = [[Hero alloc] initWithDisplayName:@"Iron Fist" insertIntoExpansion:darkCity];
    Hero *hero2_13 = [[Hero alloc] initWithDisplayName:@"Jean Grey" insertIntoExpansion:darkCity];
    Hero *hero2_14 = [[Hero alloc] initWithDisplayName:@"Nightcrawler" insertIntoExpansion:darkCity];
    Hero *hero2_15 = [[Hero alloc] initWithDisplayName:@"Professor X" insertIntoExpansion:darkCity];
    Hero *hero2_16 = [[Hero alloc] initWithDisplayName:@"Punisher" insertIntoExpansion:darkCity];
    Hero *hero2_17 = [[Hero alloc] initWithDisplayName:@"X-Force Wolverine" insertIntoExpansion:darkCity];
    
    //make necessary connections
    [mastermind2_1 addAlwaysLeadsObject:villainGroup2_2];
    [mastermind2_2 addAlwaysLeadsObject:villainGroup2_5];
    [mastermind2_3 addAlwaysLeadsObject:villainGroup2_6];
    [mastermind2_4 addAlwaysLeadsObject:villainGroup2_3];
    [mastermind2_5 addAlwaysLeadsObject:villainGroup2_4];
    
    SchemeRule *rule2_1 = [[SchemeRule alloc] init];
    rule2_1.ruleType = @(SchemeRuleTypeSetNumberOfHeroes);
    rule2_1.objectCount = @(6);
    [scheme2_2 addRulesObject:rule2_1];
    
    SchemeRule *rule2_2 = [[SchemeRule alloc] init];
    rule2_2.ruleType = @(SchemeRuleTypeAddExtraHenchmanGroupToVillainDeck);
    [rule2_2 addObjectsObject:henchmanGroup2_1];
    [scheme2_4 addRulesObject:rule2_2];
    
    SchemeRule *rule2_3 = [[SchemeRule alloc] init];
    rule2_3.ruleType = @(SchemeRuleTypeAddExtraVillainGroupToVillainDeck);
    rule2_3.objectCount = @(1);
    [scheme2_6 addRulesObject:rule2_3];
    
    SchemeRule *rule2_4 = [[SchemeRule alloc] init];
    rule2_4.ruleType = @(SchemeRuleTypeAddExtraHeroToVillainDeck);
    rule2_4.objects = [NSSet setWithObject:hero2_13];
    [scheme2_7 addRulesObject:rule2_4];
    
    SchemeRule *rule2_5 = [[SchemeRule alloc] init];
    rule2_5.ruleType = @(SchemeRuleTypeAddExtraHeroToVillainDeck);
    rule2_5.objectCount = @(1);
    [scheme2_8 addRulesObject:rule2_5];
    
    
#pragma mark Secret Wars Vol 1
    
#pragma mark Secret Wars Vol 2
    
#pragma mark Paint the Town Red
    
#pragma mark Villains

#pragma mark Guardians of the Galaxy

#pragma mark Fantastic Four
    
}

@end
