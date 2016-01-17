//
//  CardSetDisplayViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "CardTypeDisplayViewController.h"
#import "FilterCardsViewController.h"
#import "DataManager.h"
#import "DisplayableEntity.h"

@interface CardTypeDisplayViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *sourceArray;
@end

@implementation CardTypeDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Bans";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Hero"]) {
        self.sourceArray = [[DataManager sharedInstance] fetchAllHeroes];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Mastermind"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllMasterminds];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Scheme"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllSchemes];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"EnemyGroup"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllEnemyGroups];
    }
    
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(resetBans)];
    [self.navigationItem setRightBarButtonItem:resetButton];
}

- (void) resetBans{
    for (DisplayableEntity *entity in self.sourceArray) {
        entity.isVetoed = @(NO);
    }
    [[[DataManager sharedInstance] managedObjectContext] save:nil];
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    DisplayableEntity *entity = self.sourceArray[indexPath.row];
    cell.accessoryType = [entity.isVetoed boolValue]? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.textLabel.text = entity.displayName;
    cell.textLabel.font = [UIFont fontWithName:@"ComicBook-Italic" size:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayableEntity *entity = [self.sourceArray objectAtIndex:indexPath.row];
    entity.isVetoed = @(! [entity.isVetoed boolValue]);
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [[[DataManager sharedInstance] managedObjectContext] save:nil];
}

@end
