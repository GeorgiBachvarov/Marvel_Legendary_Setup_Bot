//
//  GameCreator.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/14/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scheme.h"
#import "Mastermind.h"

typedef void (^GameCreatorCallbackBlock) (NSArray *villainDeckSets, NSArray *heroDeckSets, Scheme* scheme, Mastermind *mastermind);

@interface GameCreator : NSObject

+ (void) createGameForPlayers:(NSInteger) numberOfPlayers callback:(GameCreatorCallbackBlock) callback;

@end
