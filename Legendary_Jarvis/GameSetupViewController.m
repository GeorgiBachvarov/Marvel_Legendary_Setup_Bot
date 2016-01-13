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

@interface GameSetupViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *mastermindImageView;
@property (weak, nonatomic) IBOutlet UILabel *schemeLabel;



@property (nonatomic) NSArray *mastermind;
@property (nonatomic) NSArray *villainDeckSets;
@property (nonatomic) NSArray *heroDeckSets;

@end

@implementation GameSetupViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"VillainDeckSetTableViewCell" bundle:nil] forCellReuseIdentifier:@"VillainDeckSetTableViewCell"];
    self.tableView.backgroundColor = [UIColor clearColor];
}

#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
//    return self.villainDeckSets.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VillainDeckSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VillainDeckSetTableViewCell"];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    [cell invalidateIntrinsicContentSize];
}

@end
