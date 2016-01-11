//
//  AppDelegate.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/7/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DataManager sharedInstance];
    return YES;
}


@end
