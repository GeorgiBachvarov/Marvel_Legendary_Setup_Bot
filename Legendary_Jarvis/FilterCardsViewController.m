//
//  FilterCardsViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "FilterCardsViewController.h"
#import "DataManager.h"
#import "FilterCardsTableHeaderView.h"
#import "CardTypeDisplayViewController.h"
#import "FilteredCardTableViewCell.h"

@interface FilterCardsViewController () <UITableViewDataSource, UITableViewDelegate, FilterCardsTableHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *bannedHeroes;
@property (nonatomic) NSArray *bannedMasterminds;
@property (nonatomic) NSArray *bannedSchemes;
@property (nonatomic) NSArray *bannedVillains;

@property (nonatomic, assign) NSInteger selectedHeader;

@end

@implementation FilterCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Bans";
    [self.tableView registerNib:[UINib nibWithNibName:@"FilteredCardTableViewCell" bundle:nil] forCellReuseIdentifier:@"FilteredCardTableViewCell"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void) reloadData {
    self.bannedHeroes = [[DataManager sharedInstance] fetchAllBannedHeroes];
    self.bannedMasterminds = [[DataManager sharedInstance] fetchAllBannedMasterminds];
    self.bannedSchemes = [[DataManager sharedInstance] fetchAllBannedSchemes];
    self.bannedVillains = [[DataManager sharedInstance] fetchAllBannedEnemyGroups];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CardTypeDisplayViewController *cardTypeDisplayVC = (CardTypeDisplayViewController *) segue.destinationViewController;
    
    switch (self.selectedHeader) {
        case TABLE_SECTION_HEROES:
            cardTypeDisplayVC.cardTypeClass = [Hero class];
            break;
        case TABLE_SECTION_MASTERMINDS:
            cardTypeDisplayVC.cardTypeClass = [Mastermind class];
            break;
        case TABLE_SECTION_SCHEMES:
            cardTypeDisplayVC.cardTypeClass = [Scheme class];
            break;
        case TABLE_SECTION_VILLAINS:
            cardTypeDisplayVC.cardTypeClass = [EnemyGroup class];
            
        default:
            break;
    }
}

#pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case TABLE_SECTION_HEROES:
            return self.bannedHeroes.count;
        case TABLE_SECTION_MASTERMINDS:
            return self.bannedMasterminds.count;
        case TABLE_SECTION_SCHEMES:
            return self.bannedSchemes.count;
        case TABLE_SECTION_VILLAINS:
            return self.bannedVillains.count;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilteredCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilteredCardTableViewCell"];
    
    DisplayableEntity *entity;
    switch (indexPath.section) {
        case TABLE_SECTION_HEROES:
            entity = [self.bannedHeroes objectAtIndex:indexPath.row];
            break;
        case TABLE_SECTION_MASTERMINDS:
            entity = [self.bannedMasterminds objectAtIndex:indexPath.row];
            break;
        case TABLE_SECTION_SCHEMES:
            entity = [self.bannedSchemes objectAtIndex:indexPath.row];
            break;
        case TABLE_SECTION_VILLAINS:
            entity = [self.bannedVillains objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    cell.label.text = entity.displayName;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSString *title;
    NSArray *sourceArray;
    switch (section) {
        case TABLE_SECTION_HEROES:
            title = @"Banned Heroes";
            sourceArray = self.bannedHeroes;
            break;
        case TABLE_SECTION_MASTERMINDS:
            title = @"Banned Masterminds";
            sourceArray = self.bannedMasterminds;
            break;
        case TABLE_SECTION_SCHEMES:
            title = @"Banned Schemes";
            sourceArray = self.bannedSchemes;
            break;
        case TABLE_SECTION_VILLAINS:
            title = @"Banned Villains";
            sourceArray = self.bannedVillains;
            break;
        default:
            break;
    }
    
    if (sourceArray.count) {
        title = [title stringByAppendingFormat:@" (%ld)", (long) sourceArray.count];
    }
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
    [header setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 50)];
    
    FilterCardsTableHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"FilterCardsTableHeaderView" owner:nil options:kNilOptions] firstObject];
    headerView.label.text = title;
    headerView.delegate = self;
    headerView.tag = section;
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    [header addSubview:headerView];
    NSDictionary *bindings = NSDictionaryOfVariableBindings(headerView);
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:kNilOptions metrics:nil views:bindings]];
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView]|" options:kNilOptions metrics:nil views:bindings]];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

#pragma mark FilterCardsTableViewHeaderDelegate

- (void)addButtonTappedInFilterCardsTableHeaderView:(FilterCardsTableHeaderView *)headerView{
    self.selectedHeader = headerView.tag;
    [self performSegueWithIdentifier:@"FilterCardsToCardTypeDisplaySegue" sender:nil];
}

@end
