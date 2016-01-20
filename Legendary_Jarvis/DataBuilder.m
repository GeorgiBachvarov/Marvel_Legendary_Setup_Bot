//
//  DataBuilder.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.

#import "DataBuilder.h"
#import "DataManager.h"
#import "NSDate+Legendary.h"
@implementation DataBuilder

+ (void)buildLegendaryData{
    NSManagedObjectContext *ctx = [[DataManager sharedInstance] managedObjectContext];

    
    //build expansions one by one
    
    
    
    
#pragma mark Basic Set
    
    //init all data
    Expansion *basicSet = [[Expansion alloc] initWithDisplayName:@"Basic Set"];
    [basicSet setReleaseDate:[[NSDate alloc] initWithYear:2012 month:11 day:13]];
    
    Scheme *scheme1_1 = [[Scheme alloc] initWithDisplayName:@"The Legacy Virus" insertIntoExpansion:basicSet];
    Scheme *scheme1_2 = [[Scheme alloc] initWithDisplayName:@"Midtown Bank Robbery" insertIntoExpansion:basicSet];
    Scheme *scheme1_3 = [[Scheme alloc] initWithDisplayName:@"Negative Zone Prizon Breakout" insertIntoExpansion:basicSet];
    Scheme *scheme1_4 = [[Scheme alloc] initWithDisplayName:@"Portals to the Dark Dimension" insertIntoExpansion:basicSet];
    Scheme *scheme1_5 = [[Scheme alloc] initWithDisplayName:@"Replace Earth's Leaders with Killbots" insertIntoExpansion:basicSet];
    Scheme *scheme1_6 = [[Scheme alloc] initWithDisplayName:@"Secret Invasion of the Skrull Shapeshifters" insertIntoExpansion:basicSet];
    Scheme *scheme1_7 = [[Scheme alloc] initWithDisplayName:@"Super Hero Civil War" insertIntoExpansion:basicSet];
    Scheme *scheme1_8 = [[Scheme alloc] initWithDisplayName:@"Unleash the Power of the Cosmic Cube" insertIntoExpansion:basicSet];
    
    Mastermind *mastermind1_1 = [[Mastermind alloc] initWithDisplayName:@"Red Skull" insertIntoExpansion:basicSet];
    Mastermind *mastermind1_2 = [[Mastermind alloc] initWithDisplayName:@"Magneto" insertIntoExpansion:basicSet];
    Mastermind *mastermind1_3 = [[Mastermind alloc] initWithDisplayName:@"Dr. Doom" insertIntoExpansion:basicSet];
    Mastermind *mastermind1_4 = [[Mastermind alloc] initWithDisplayName:@"Loki" insertIntoExpansion:basicSet];
    
    VillainGroup *villainGroup1_1 = [[VillainGroup alloc] initWithDisplayName:@"Brotherhood" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_2 = [[VillainGroup alloc] initWithDisplayName:@"Enemies of Asgard" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_3 = [[VillainGroup alloc] initWithDisplayName:@"HYDRA" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_4 = [[VillainGroup alloc] initWithDisplayName:@"Masters of Evil" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_5 = [[VillainGroup alloc] initWithDisplayName:@"Radiation" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_6 = [[VillainGroup alloc] initWithDisplayName:@"Skrulls" insertIntoExpansion:basicSet];
    VillainGroup *villainGroup1_7 = [[VillainGroup alloc] initWithDisplayName:@"Spider Foes" insertIntoExpansion:basicSet];
    
    HenchmanGroup *henchmanGroup1_1 = [[HenchmanGroup alloc] initWithDisplayName:@"Doombot Legion" insertIntoExpansion:basicSet];
    HenchmanGroup *henchmanGroup1_2 = [[HenchmanGroup alloc] initWithDisplayName:@"Hand Ninjas" insertIntoExpansion:basicSet];
    HenchmanGroup *henchmanGroup1_3 = [[HenchmanGroup alloc] initWithDisplayName:@"Savage Land Mutants" insertIntoExpansion:basicSet];
    HenchmanGroup *henchmanGroup1_4 = [[HenchmanGroup alloc] initWithDisplayName:@"Sentinels" insertIntoExpansion:basicSet];
    
    Hero *hero1_1 = [[Hero alloc] initWithDisplayName:@"Black Widow" insertIntoExpansion:basicSet];
    Hero *hero1_2 = [[Hero alloc] initWithDisplayName:@"Captain America" insertIntoExpansion:basicSet];
    Hero *hero1_3 = [[Hero alloc] initWithDisplayName:@"Cyclops" insertIntoExpansion:basicSet];
    Hero *hero1_4 = [[Hero alloc] initWithDisplayName:@"Deadpool" insertIntoExpansion:basicSet];
    Hero *hero1_5 = [[Hero alloc] initWithDisplayName:@"Emma Frost" insertIntoExpansion:basicSet];
    Hero *hero1_6 = [[Hero alloc] initWithDisplayName:@"Gambit" insertIntoExpansion:basicSet];
    Hero *hero1_7 = [[Hero alloc] initWithDisplayName:@"Hawkeye" insertIntoExpansion:basicSet];
    Hero *hero1_8 = [[Hero alloc] initWithDisplayName:@"Hulk" insertIntoExpansion:basicSet];
    Hero *hero1_9 = [[Hero alloc] initWithDisplayName:@"Iron Man" insertIntoExpansion:basicSet];
    Hero *hero1_10 = [[Hero alloc] initWithDisplayName:@"Nick Fury" insertIntoExpansion:basicSet];
    Hero *hero1_11 = [[Hero alloc] initWithDisplayName:@"Rogue" insertIntoExpansion:basicSet];
    Hero *hero1_12 = [[Hero alloc] initWithDisplayName:@"Spider-Man" insertIntoExpansion:basicSet];
    Hero *hero1_13 = [[Hero alloc] initWithDisplayName:@"Storm" insertIntoExpansion:basicSet];
    Hero *hero1_14 = [[Hero alloc] initWithDisplayName:@"Thor" insertIntoExpansion:basicSet];
    Hero *hero1_15 = [[Hero alloc] initWithDisplayName:@"Wolverine" insertIntoExpansion:basicSet];
    
    //make necessary connections
    [mastermind1_1 addAlwaysLeadsObject:villainGroup1_3];
    [mastermind1_2 addAlwaysLeadsObject:villainGroup1_1];
    [mastermind1_3 addAlwaysLeadsObject:henchmanGroup1_1];
    [mastermind1_4 addAlwaysLeadsObject:villainGroup1_2];
    
    SchemeRule *rule1_1 = [[SchemeRule alloc] init];
    rule1_1.ruleType = @(SchemeRuleTypeAddExtraHenchmanGroupToVillainDeck);
    rule1_1.objectCount = @(1);
    [scheme1_3 addRulesObject:rule1_1];
    
    SchemeRule *rule1_2 = [[SchemeRule alloc] init];
    rule1_2.ruleType = @(SchemeRuleTypeAddSpecificVillainGroupToVillainDeck);
    rule1_2.objects = [NSSet setWithObjects:villainGroup1_6, nil];;
    [scheme1_6 addRulesObject:rule1_2];
    
    SchemeRule *rule1_3 = [[SchemeRule alloc] init];
    rule1_3.ruleType = @(SchemeRuleTypeSetNumberOfHeroes);
    rule1_3.objectCount = @(6);
    [scheme1_6 addRulesObject:rule1_3];

    
#pragma mark Dark City
    
    //init all data
    Expansion *darkCity = [[Expansion alloc] initWithDisplayName:@"Dark City"];
    [darkCity setReleaseDate:[[NSDate alloc] initWithYear:2013 month:6 day:19]];
    
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
    
    //init all data
    Expansion *secretWarsVol1 = [[Expansion alloc] initWithDisplayName:@"Secret Wars Vol 1"];
    [secretWarsVol1 setReleaseDate:[[NSDate alloc] initWithYear:2015 month:8 day:5]];
    
    Scheme *scheme3_1 = [[Scheme alloc] initWithDisplayName:@"Fragmented Realities" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_2 = [[Scheme alloc] initWithDisplayName:@"Crush Them With My Bare Hands" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_3 = [[Scheme alloc] initWithDisplayName:@"Corrupt the Next Generation of Heroes" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_4 = [[Scheme alloc] initWithDisplayName:@"Smash Two Dimensions Together" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_5 = [[Scheme alloc] initWithDisplayName:@"Build an Army of Annihilation" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_6 = [[Scheme alloc] initWithDisplayName:@"Master of Tyrants" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_7 = [[Scheme alloc] initWithDisplayName:@"Pan-Dimensional Plague" insertIntoExpansion:secretWarsVol1];
    Scheme *scheme3_8 = [[Scheme alloc] initWithDisplayName:@"Dark Alliance" insertIntoExpansion:secretWarsVol1];
    
    Mastermind *mastermind3_1 = [[Mastermind alloc] initWithDisplayName:@"Zombie Green Goblin" insertIntoExpansion:secretWarsVol1];
    Mastermind *mastermind3_2 = [[Mastermind alloc] initWithDisplayName:@"Wasteland Hulk" insertIntoExpansion:secretWarsVol1];
    Mastermind *mastermind3_3 = [[Mastermind alloc] initWithDisplayName:@"Madelyne Pryor, Goblin Queen" insertIntoExpansion:secretWarsVol1];
    Mastermind *mastermind3_4 = [[Mastermind alloc] initWithDisplayName:@"Nimrod, Super Sentinel" insertIntoExpansion:secretWarsVol1];
    
    VillainGroup *villainGroup3_1 = [[VillainGroup alloc] initWithDisplayName:@"Sentinel Territories" insertIntoExpansion:secretWarsVol1];
    VillainGroup *villainGroup3_2 = [[VillainGroup alloc] initWithDisplayName:@"The Deadlands" insertIntoExpansion:secretWarsVol1];
    VillainGroup *villainGroup3_3 = [[VillainGroup alloc] initWithDisplayName:@"Manhattan (Earth-1610)" insertIntoExpansion:secretWarsVol1];
    VillainGroup *villainGroup3_4 = [[VillainGroup alloc] initWithDisplayName:@"Domain of Apocalypse" insertIntoExpansion:secretWarsVol1];
    VillainGroup *villainGroup3_5 = [[VillainGroup alloc] initWithDisplayName:@"Limbo" insertIntoExpansion:secretWarsVol1];
    VillainGroup *villainGroup3_6 = [[VillainGroup alloc] initWithDisplayName:@"Wasteland" insertIntoExpansion:secretWarsVol1];
    
    HenchmanGroup *henchmanGroup3_1 = [[HenchmanGroup alloc] initWithDisplayName:@"Ghost Racers" insertIntoExpansion:secretWarsVol1];
    HenchmanGroup *henchmanGroup3_2 = [[HenchmanGroup alloc] initWithDisplayName:@"M.O.D.O.K.s" insertIntoExpansion:secretWarsVol1];
    HenchmanGroup *henchmanGroup3_3 = [[HenchmanGroup alloc] initWithDisplayName:@"Thor Corps" insertIntoExpansion:secretWarsVol1];
    
    Hero *hero3_1 = [[Hero alloc] initWithDisplayName:@"Black Panther" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_2 = [[Hero alloc] initWithDisplayName:@"Black Bolt" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_3 = [[Hero alloc] initWithDisplayName:@"Dr. Strange" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_4 = [[Hero alloc] initWithDisplayName:@"Superior Iron Man" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_5 = [[Hero alloc] initWithDisplayName:@"Thanos" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_6 = [[Hero alloc] initWithDisplayName:@"Namor" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_7 = [[Hero alloc] initWithDisplayName:@"Maximus" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_8 = [[Hero alloc] initWithDisplayName:@"Proxima Midnight" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_9 = [[Hero alloc] initWithDisplayName:@"Magik" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_10 = [[Hero alloc] initWithDisplayName:@"Old Man Logan" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_11 = [[Hero alloc] initWithDisplayName:@"Apocalyptic Kitty Pryde" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_12 = [[Hero alloc] initWithDisplayName:@"Captain Marvel" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_13 = [[Hero alloc] initWithDisplayName:@"Lady Thor" insertIntoExpansion:secretWarsVol1];
    Hero *hero3_14 = [[Hero alloc] initWithDisplayName:@"Ultimate Spider-Man" insertIntoExpansion:secretWarsVol1];
    
    //make necessary connections
    [mastermind3_1 addAlwaysLeadsObject:villainGroup3_2];
    [mastermind3_2 addAlwaysLeadsObject:villainGroup3_6];
    [mastermind3_3 addAlwaysLeadsObject:villainGroup3_5];
    [mastermind3_4 addAlwaysLeadsObject:villainGroup3_1];
    
    SchemeRule *rule3_1 = [[SchemeRule alloc] init];
    rule3_1.ruleType = @(SchemeRuleTypeAddExtraVillainGroupToVillainDeck);
    rule3_1.objectCount = @(1);
    [scheme3_4 addRulesObject:rule3_1];
    
    SchemeRule *rule3_2 = [[SchemeRule alloc] init];
    rule3_2.ruleType = @(SchemeRuleTypeAddExtraMastermindToVillainDeck);
    rule3_2.objectCount = @(3);
    [scheme3_6 addRulesObject:rule3_2];
    
    SchemeRule *rule3_3 = [[SchemeRule alloc] init];
    rule3_3.ruleType = @(SchemeRuleTypeAddExtraMastermindToVillainDeck);
    rule3_3.objectCount = @(1);
    [scheme3_8 addRulesObject:rule3_3];
    
    SchemeRule *rule3_4 = [[SchemeRule alloc] init];
    rule3_4.ruleType = @(SchemeRuleTypeAddExtraVillainGroupToVillainDeck);
    rule3_4.objectCount = @(1);
    [scheme3_1 addRulesObject:rule3_4];
    
    return;
#pragma mark Fantastic Four
    
    //init all data
    Expansion *fantasticFour = [[Expansion alloc] initWithDisplayName:@"Fantastic Four"];
    [fantasticFour setReleaseDate:[[NSDate alloc] initWithYear:2013 month:10 day:15]];
    
    Scheme *scheme4_1 = [[Scheme alloc] initWithDisplayName:@"Bathe Earth in Cosmic Rays" insertIntoExpansion:fantasticFour];
    Scheme *scheme4_2 = [[Scheme alloc] initWithDisplayName:@"Flood the Planet with Melted Glaciers" insertIntoExpansion:fantasticFour];
    Scheme *scheme4_3 = [[Scheme alloc] initWithDisplayName:@"Invincible Force Field" insertIntoExpansion:fantasticFour];
    Scheme *scheme4_4 = [[Scheme alloc] initWithDisplayName:@"Pull Reality into the Negative Zone" insertIntoExpansion:fantasticFour];
    
    Mastermind *mastermind4_1 = [[Mastermind alloc] initWithDisplayName:@"Galactus" insertIntoExpansion:fantasticFour];
    Mastermind *mastermind4_2 = [[Mastermind alloc] initWithDisplayName:@"Mole Man" insertIntoExpansion:fantasticFour];
    
    VillainGroup *villainGroup4_1 = [[VillainGroup alloc] initWithDisplayName:@"Subterranea" insertIntoExpansion:fantasticFour];
    VillainGroup *villainGroup4_2 = [[VillainGroup alloc] initWithDisplayName:@"Heralds of Galactus" insertIntoExpansion:fantasticFour];
    
    Hero *hero4_1 = [[Hero alloc] initWithDisplayName:@"Mr. Fantastic" insertIntoExpansion:fantasticFour];
    Hero *hero4_2 = [[Hero alloc] initWithDisplayName:@"Invisible Woman" insertIntoExpansion:fantasticFour];
    Hero *hero4_3 = [[Hero alloc] initWithDisplayName:@"Thing" insertIntoExpansion:fantasticFour];
    Hero *hero4_4 = [[Hero alloc] initWithDisplayName:@"Human Torch" insertIntoExpansion:fantasticFour];
    Hero *hero4_5 = [[Hero alloc] initWithDisplayName:@"Silver Surfer" insertIntoExpansion:fantasticFour];
    
    //make necessary connections
    //TODO
    [mastermind4_1 addAlwaysLeadsObject:villainGroup4_2];
    [mastermind4_2 addAlwaysLeadsObject:villainGroup4_1];
    
#pragma mark Paint the Town Red
    
    //init all data
    Expansion *paintTheTownRed = [[Expansion alloc] initWithDisplayName:@"Paint the Town Red"];
    [paintTheTownRed setReleaseDate:[[NSDate alloc] initWithYear:2014 month:3 day:12]];
    
    Scheme *scheme5_1 = [[Scheme alloc] initWithDisplayName:@"Invade the Daily Bugle News HQ" insertIntoExpansion:paintTheTownRed];
    Scheme *scheme5_2 = [[Scheme alloc] initWithDisplayName:@"Splice Humans with Spider DNA" insertIntoExpansion:paintTheTownRed];
    Scheme *scheme5_3 = [[Scheme alloc] initWithDisplayName:@"The Clone Saga" insertIntoExpansion:paintTheTownRed];
    Scheme *scheme5_4 = [[Scheme alloc] initWithDisplayName:@"Weave a Web of Lies" insertIntoExpansion:paintTheTownRed];
    
    Mastermind *mastermind5_1 = [[Mastermind alloc] initWithDisplayName:@"Carnage" insertIntoExpansion:paintTheTownRed];
    Mastermind *mastermind5_2 = [[Mastermind alloc] initWithDisplayName:@"Mysterio" insertIntoExpansion:paintTheTownRed];
    
    VillainGroup *villainGroup5_1 = [[VillainGroup alloc] initWithDisplayName:@"Maximum Carnage" insertIntoExpansion:paintTheTownRed];
    VillainGroup *villainGroup5_2 = [[VillainGroup alloc] initWithDisplayName:@"Sinister Six" insertIntoExpansion:paintTheTownRed];
    
    Hero *hero5_1 = [[Hero alloc] initWithDisplayName:@"Black Cat" insertIntoExpansion:paintTheTownRed];
    Hero *hero5_2 = [[Hero alloc] initWithDisplayName:@"Moon Knight" insertIntoExpansion:paintTheTownRed];
    Hero *hero5_3 = [[Hero alloc] initWithDisplayName:@"Scarlet Spider" insertIntoExpansion:paintTheTownRed];
    Hero *hero5_4 = [[Hero alloc] initWithDisplayName:@"Spider-Woman" insertIntoExpansion:paintTheTownRed];
    Hero *hero5_5 = [[Hero alloc] initWithDisplayName:@"Symbiote Spider-Man" insertIntoExpansion:paintTheTownRed];
    
    //make necessary connections
    //TODO
    [mastermind5_1 addAlwaysLeadsObject:villainGroup5_1];
    [mastermind5_2 addAlwaysLeadsObject:villainGroup5_2];
    
#pragma mark Secret Wars Vol 2
    
    //init all data
    Expansion *secretWarsVol2 = [[Expansion alloc] initWithDisplayName:@"Secret Wars Vol 2"];
    [secretWarsVol2 setReleaseDate:[[NSDate alloc] initWithYear:2015 month:12 day:9]];
    
    Scheme *scheme6_1 = [[Scheme alloc] initWithDisplayName:@"Sinister Ambitions" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_2 = [[Scheme alloc] initWithDisplayName:@"Deadlands Hordes Charge the Wall" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_3 = [[Scheme alloc] initWithDisplayName:@"Enthrone the Barons of Battleworld" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_4 = [[Scheme alloc] initWithDisplayName:@"Master the Mysteries of Kung-Fu" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_5 = [[Scheme alloc] initWithDisplayName:@"Secret Wars" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_6 = [[Scheme alloc] initWithDisplayName:@"The Fountain of Enternal Life" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_7 = [[Scheme alloc] initWithDisplayName:@"The God-Emperor of Battleworld" insertIntoExpansion:secretWarsVol2];
    Scheme *scheme6_8 = [[Scheme alloc] initWithDisplayName:@"The Mark of Khonshu" insertIntoExpansion:secretWarsVol2];
    
    Mastermind *mastermind6_1 = [[Mastermind alloc] initWithDisplayName:@"King Hyperion" insertIntoExpansion:secretWarsVol2];
    Mastermind *mastermind6_2 = [[Mastermind alloc] initWithDisplayName:@"Spider Queen" insertIntoExpansion:secretWarsVol2];
    Mastermind *mastermind6_3 = [[Mastermind alloc] initWithDisplayName:@"Shiklah, the Demon Bride" insertIntoExpansion:secretWarsVol2];
    Mastermind *mastermind6_4 = [[Mastermind alloc] initWithDisplayName:@"Immortal Emperor Zheng-Zhu" insertIntoExpansion:secretWarsVol2];
    
    VillainGroup *villainGroup6_1 = [[VillainGroup alloc] initWithDisplayName:@"Utopolis" insertIntoExpansion:secretWarsVol2];
    VillainGroup *villainGroup6_2 = [[VillainGroup alloc] initWithDisplayName:@"Guardians of Knowhere" insertIntoExpansion:secretWarsVol2];
    VillainGroup *villainGroup6_3 = [[VillainGroup alloc] initWithDisplayName:@"Deadpool's Secret Secret Wars" insertIntoExpansion:secretWarsVol2];
    VillainGroup *villainGroup6_4 = [[VillainGroup alloc] initWithDisplayName:@"X-Men 92" insertIntoExpansion:secretWarsVol2];
    VillainGroup *villainGroup6_5 = [[VillainGroup alloc] initWithDisplayName:@"K'un Lun" insertIntoExpansion:secretWarsVol2];
    VillainGroup *villainGroup6_6 = [[VillainGroup alloc] initWithDisplayName:@"Monster Metropolis" insertIntoExpansion:secretWarsVol2];
    
    HenchmanGroup *henchmanGroup6_1 = [[HenchmanGroup alloc] initWithDisplayName:@"Magma Men" insertIntoExpansion:secretWarsVol2];
    HenchmanGroup *henchmanGroup6_2 = [[HenchmanGroup alloc] initWithDisplayName:@"Spider-Infected" insertIntoExpansion:secretWarsVol2];
    HenchmanGroup *henchmanGroup6_3 = [[HenchmanGroup alloc] initWithDisplayName:@"Khonshu Guardians" insertIntoExpansion:secretWarsVol2];
    
    Hero *hero6_1 = [[Hero alloc] initWithDisplayName:@"Beast" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_2 = [[Hero alloc] initWithDisplayName:@"Captain Britain" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_3 = [[Hero alloc] initWithDisplayName:@"Corvus Glaive" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_4 = [[Hero alloc] initWithDisplayName:@"Black Swan" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_5 = [[Hero alloc] initWithDisplayName:@"Ruby Summers" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_6 = [[Hero alloc] initWithDisplayName:@"Time-Traveling Jean Grey" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_7 = [[Hero alloc] initWithDisplayName:@"Phoenix Force Cyclops" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_8 = [[Hero alloc] initWithDisplayName:@"Soulsword Colossus" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_9 = [[Hero alloc] initWithDisplayName:@"Silk" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_10 = [[Hero alloc] initWithDisplayName:@"Agent Venom" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_11 = [[Hero alloc] initWithDisplayName:@"Spider-Gwen" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_12 = [[Hero alloc] initWithDisplayName:@"Shang-Chi" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_13 = [[Hero alloc] initWithDisplayName:@"Dr Punisher, Soldier Supreme" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_14 = [[Hero alloc] initWithDisplayName:@"Elsa Bloodstone" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_15 = [[Hero alloc] initWithDisplayName:@"The Captain and the Devil" insertIntoExpansion:secretWarsVol2];
    Hero *hero6_16 = [[Hero alloc] initWithDisplayName:@"Arkon the Magnificent" insertIntoExpansion:secretWarsVol2];
    
    //make necessary connections
    //TODO
    [mastermind6_1 addAlwaysLeadsObject:villainGroup6_1];
    
#pragma mark Guardians of the Galaxy
    
    //init all data
    Expansion *guardiansOfTheGalaxy = [[Expansion alloc] initWithDisplayName:@"Guardians of the Galaxy]"];
    [guardiansOfTheGalaxy setReleaseDate:[[NSDate alloc] initWithYear:2014 month:10 day:15]];
    
    Scheme *scheme7_1 = [[Scheme alloc] initWithDisplayName:@"Unite the Shards" insertIntoExpansion:guardiansOfTheGalaxy];
    Scheme *scheme7_2 = [[Scheme alloc] initWithDisplayName:@"Forge the Infinity Gauntlet" insertIntoExpansion:paintTheTownRed];
    Scheme *scheme7_3 = [[Scheme alloc] initWithDisplayName:@"Intergalactic Kree Nega-Bomb" insertIntoExpansion:guardiansOfTheGalaxy];
    Scheme *scheme7_4 = [[Scheme alloc] initWithDisplayName:@"The Kree-Skrull War" insertIntoExpansion:guardiansOfTheGalaxy];
    
    Mastermind *mastermind7_1 = [[Mastermind alloc] initWithDisplayName:@"Supreme Intelligence of the Kree" insertIntoExpansion:guardiansOfTheGalaxy];
    Mastermind *mastermind7_2 = [[Mastermind alloc] initWithDisplayName:@"Thanos" insertIntoExpansion:guardiansOfTheGalaxy];
    
    VillainGroup *villainGroup7_1 = [[VillainGroup alloc] initWithDisplayName:@"Infinity Gems" insertIntoExpansion:guardiansOfTheGalaxy];
    VillainGroup *villainGroup7_2 = [[VillainGroup alloc] initWithDisplayName:@"Kree Starforce" insertIntoExpansion:guardiansOfTheGalaxy];
    
    Hero *hero7_1 = [[Hero alloc] initWithDisplayName:@"Drax the Destroyer" insertIntoExpansion:guardiansOfTheGalaxy];
    Hero *hero7_2 = [[Hero alloc] initWithDisplayName:@"Gamora" insertIntoExpansion:guardiansOfTheGalaxy];
    Hero *hero7_3 = [[Hero alloc] initWithDisplayName:@"Groot" insertIntoExpansion:guardiansOfTheGalaxy];
    Hero *hero7_4 = [[Hero alloc] initWithDisplayName:@"Rocket Raccoon" insertIntoExpansion:guardiansOfTheGalaxy];
    Hero *hero7_5 = [[Hero alloc] initWithDisplayName:@"Star-Lord" insertIntoExpansion:guardiansOfTheGalaxy];
    
    //make necessary connections
    //TODO
    [mastermind7_1 addAlwaysLeadsObject:villainGroup7_2];
    [mastermind7_2 addAlwaysLeadsObject:villainGroup7_1];
    
#pragma mark Villains
    
    
}

@end
