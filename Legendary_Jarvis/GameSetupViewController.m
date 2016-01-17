//
//  GameSetupViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "GameSetupViewController.h"
#import "Mastermind.h"
#import "VillainDeckSetTableViewCell.h"
#import "DataManager.h"
#import "GameCreator.h"

@interface GameSetupViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UITableView *villainDeckTableView;
@property (weak, nonatomic) IBOutlet UITableView *heroDeckTableView;
@property (weak, nonatomic) IBOutlet UIImageView *mastermindImageView;



@property (weak, nonatomic) IBOutlet UILabel *schemeLabel;

- (IBAction)closeButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *backgroundScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;




@property (nonatomic) Scheme *scheme;
@property (nonatomic) Mastermind *mastermind;
@property (nonatomic) NSArray *villainDeckSets;
@property (nonatomic) NSArray *heroDeckSets;

@end

@implementation GameSetupViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.villainDeckTableView registerNib:[UINib nibWithNibName:@"VillainDeckSetTableViewCell" bundle:nil] forCellReuseIdentifier:@"VillainDeckSetTableViewCell"];
    self.villainDeckTableView.backgroundColor = [UIColor clearColor];
    
    [self.heroDeckTableView registerNib:[UINib nibWithNibName:@"VillainDeckSetTableViewCell" bundle:nil] forCellReuseIdentifier:@"VillainDeckSetTableViewCell"];
    self.heroDeckTableView.backgroundColor = [UIColor clearColor];
    
    self.mastermindImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.mastermindImageView.layer.borderWidth = 3.f;
    
    self.schemeLabel.font = [UIFont fontWithName:@"ComicBook" size:18];
    self.mainScrollView.delegate = self;
    
    [GameCreator createGameForPlayers:self.numberOfPlayersForGame callback:^(NSArray *villainDeckSets, NSArray *heroDeckSets, Scheme *scheme, Mastermind *mastermind) {
        self.scheme = scheme;
        self.mastermind = mastermind;
        self.villainDeckSets = villainDeckSets;
        self.heroDeckSets = heroDeckSets;
        [self reloadAll];
    }];
}

- (void) reloadAll{
    self.mastermindImageView.image = [UIImage imageNamed:self.mastermind.displayName];
    self.schemeLabel.text = self.scheme.displayName;
    [self.villainDeckTableView reloadData];
    [self.heroDeckTableView reloadData];
}

#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableView == self.villainDeckTableView? self.villainDeckSets.count : self.heroDeckSets.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VillainDeckSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VillainDeckSetTableViewCell"];
    CardSet *cardSet = tableView == self.villainDeckTableView? [self.villainDeckSets objectAtIndex:indexPath.row] : [self.heroDeckSets objectAtIndex:indexPath.row];
    cell.villainDeckDisplayNameLabel.text = cardSet.displayName;
    cell.villainDeckImage.image = [UIImage imageNamed:cardSet.displayName];
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    [cell invalidateIntrinsicContentSize];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.mainScrollView) {
        [self.backgroundScrollView setContentOffset:CGPointMake(scrollView.contentOffset.x * 0.75, 0)];
        
        if (scrollView.contentOffset.x < scrollView.bounds.size.width/2) {
            [self.pageControl setCurrentPage:0];
        }else{
            [self.pageControl setCurrentPage:1];
        }
    }
}

#pragma mark IBAction

- (IBAction)closeButtonTapped:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
