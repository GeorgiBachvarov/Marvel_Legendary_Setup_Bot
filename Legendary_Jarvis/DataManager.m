//
//  DataManager.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/11/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "DataManager.h"
#import "DataBuilder.h"

@interface DataManager ()


- (void)initializeCoreData;

@end

@implementation DataManager

+ (instancetype)sharedInstance{
    static DataManager *result;
    
    static dispatch_once_t dataManagerOnceToken;
    dispatch_once(&dataManagerOnceToken, ^{
        result = [[DataManager alloc] init];
    });
    
    return result;
}

- (id)init
{
    self = [super init];
    if (!self){
      return nil;
    }
    
    [self initializeCoreData];
    
    return self;
}


- (void)initializeCoreData
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Legendary_Jarvis" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setManagedObjectContext:moc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Legendary_Jarvis.sqlite"];
    
    BOOL databaseInitializationIsNeeded = YES;
    
    if ([fileManager fileExistsAtPath:[storeURL path]]) {
        databaseInitializationIsNeeded = NO;
    }
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
        
        if (databaseInitializationIsNeeded) {
            [DataBuilder buildLegendaryData];
        }
    });
}

#pragma mark Requests

- (NSArray *)fetchAllSchemes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Scheme"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *)fetchAllMasterminds{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Mastermind"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *)fetchAllVillainGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"VillainGroup"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *)fetchAllHenchmanGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"HenchmanGroup"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *)fetchAllHeroes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *)fetchAllEnemyGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"EnemyGroup"];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;

}

- (NSArray *) fetchAllNotBannedSchemes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Scheme"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllNotBannedMasterminds{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Mastermind"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllNotBannedVillainGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"VillainGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllNotBannedHenchmanGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"HenchmanGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllNotBannedHeroes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllNotBannedEnemyGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"EnemyGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == NO"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}


- (NSArray *) fetchAllBannedSchemes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Scheme"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllBannedMasterminds{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Mastermind"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllBannedVillainGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"VillainGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllBannedHenchmanGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"HenchmanGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllBannedHeroes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}

- (NSArray *) fetchAllBannedEnemyGroups{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"EnemyGroup"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isVetoed == YES"];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return result;
}



@end
