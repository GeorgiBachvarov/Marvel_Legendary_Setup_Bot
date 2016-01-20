//
//  ExpansionsViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/20/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "ExpansionsViewController.h"
#import "ExpansionTableViewCell.h"
#import "Expansion.h"
#import "DataManager.h"

@interface ExpansionsViewController () <UITableViewDelegate, UITableViewDataSource, ExpansionTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *expansions;

@end

@implementation ExpansionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Expansions";
    [self.tableView registerNib:[UINib nibWithNibName:@"ExpansionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ExpansionTableViewCell"];
    self.expansions = [[DataManager sharedInstance] fetchAllExpansions];
}

#pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.expansions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpansionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpansionTableViewCell"];
    
    Expansion *expantion = [self.expansions objectAtIndex:indexPath.row];
    
    cell.tag = indexPath.row;
    cell.expansionTitleLabel.text = expantion.displayName;
    [cell.isOwnedSwitch setOn:[expantion.isOwned integerValue]];
    cell.delegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark ExpansionTableViewCellDelegate

- (void)expansionTableViewCell:(ExpansionTableViewCell *)expansionTableViewCell valueChanged:(BOOL)newValue{
    [[self.expansions objectAtIndex:expansionTableViewCell.tag] setIsOwned:@(newValue)];
    [self.tableView reloadRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:expansionTableViewCell.tag inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [[[DataManager sharedInstance] managedObjectContext] save:nil];
}




@end
