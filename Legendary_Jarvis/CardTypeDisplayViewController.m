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
#import "FilterCardsTableHeaderView.h"

@interface CardTypeDisplayViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *sourceArray;
@property (nonatomic) NSArray *jaggedSourceArrayByExpansion;
@property (nonatomic) NSArray *expansions;
@end

@implementation CardTypeDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Bans";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
    
    if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Hero"]) {
        self.sourceArray = [[DataManager sharedInstance] fetchAllHeroes];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Mastermind"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllMasterminds];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"Scheme"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllSchemes];
    }else if ([NSStringFromClass(self.cardTypeClass) isEqualToString:@"EnemyGroup"]){
        self.sourceArray = [[DataManager sharedInstance] fetchAllEnemyGroups];
    }
    
    self.sourceArray = [self.sourceArray sortedArrayUsingDescriptors:@[ [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES]]];
    
    NSMutableArray *jaggedArray = [NSMutableArray array];
    NSArray *expansions = [[[DataManager sharedInstance] fetchAllExpansions] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isOwned == YES"]];
    self.expansions = expansions;
    
    for (id expansion in expansions) {
        NSLog(@"%@", [expansion displayName]);
        [jaggedArray addObject:[NSMutableArray array]];
    }
    for (CardSet *set in self.sourceArray) {
        for (Expansion *expansion in self.expansions) {
            if (expansion == [(id)set expansion]) {
                [jaggedArray[[self.expansions indexOfObject:expansion]] addObject:set];
                break;
            }
        }
    }
    
    self.jaggedSourceArrayByExpansion = jaggedArray;
    
    
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
    return self.expansions.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.jaggedSourceArrayByExpansion[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    DisplayableEntity *entity = self.jaggedSourceArrayByExpansion[indexPath.section][indexPath.row];
    cell.accessoryType = [entity.isVetoed boolValue]? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.textLabel.text = [NSString stringWithFormat:@"   %@", entity.displayName];
    cell.textLabel.font = [UIFont fontWithName:@"ComicBook-Italic" size:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayableEntity *entity = self.jaggedSourceArrayByExpansion[indexPath.section][indexPath.row];
    entity.isVetoed = @(! [entity.isVetoed boolValue]);
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [[[DataManager sharedInstance] managedObjectContext] save:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
    [header setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 50)];
    
    FilterCardsTableHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"FilterCardsTableHeaderView" owner:nil options:kNilOptions] firstObject];
    headerView.label.text = [self.expansions[section] displayName];
    headerView.addButton.hidden = YES;
    [header addSubview:headerView];
    
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(headerView);
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:kNilOptions metrics:nil views:bindings]];
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView]|" options:kNilOptions metrics:nil views:bindings]];
    return header;
}

@end
