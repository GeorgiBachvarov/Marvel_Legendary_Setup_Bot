//
//  SchemeRule.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Scheme;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SchemeRuleType) {
    SchemeRuleTypeAddExtraVillainGroupToVillainDeck,
    SchemeRuleTypeAddExtraHenchmanGroupToVillainDeck,
    SchemeRuleTypeAddExtraHeroToVillainDeck,
    SchemeRuleTypeAddExtraMastermindToVillainDeck,
    
    SchemeRuleTypeSetNumberOfHeroes,
};

@interface SchemeRule : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "SchemeRule+CoreDataProperties.h"
