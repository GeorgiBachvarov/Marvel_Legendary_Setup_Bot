//
//  NumberOfPlayersViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/12/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "NumberOfPlayersViewController.h"
#import "GameSetupViewController.h"

@interface NumberOfPlayersViewController ()
- (IBAction)onePlayerButtonPressed:(id)sender;
- (IBAction)twoPlayerButtonPressed:(id)sender;
- (IBAction)threePlayerButtonPressed:(id)sender;
- (IBAction)fourPlayerButtonPressed:(id)sender;
- (IBAction)fivePlayerButtonPressed:(id)sender;


@property (nonatomic) IBOutletCollection(UIView) NSArray* buttons;

@property (nonatomic, assign) NSInteger numberOfPlayersSelected;

@end

@implementation NumberOfPlayersViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Number of Players";
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    self.buttons = [self.buttons sortedArrayUsingDescriptors:@[ [NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES] ]];
    
    UIButton *settingsInnerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsInnerButton setFrame:CGRectMake(0, 0, 30, 30)];
    [settingsInnerButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    [settingsInnerButton addTarget:self action:@selector(settingsTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithCustomView:settingsInnerButton];
    [self.navigationItem setLeftBarButtonItem:settingsButton];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIButton *button in self.buttons) {
        button.alpha = 0;
    }
    CGFloat duration = 0.3;
    for (UIButton *numberButton in self.buttons) {
        [UIView animateWithDuration:duration delay:(numberButton.tag - 1)*(duration/2) options:0 animations:^{
            [UIView setAnimationRepeatCount:1];
            numberButton.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (IBAction)onePlayerButtonPressed:(id)sender {
    self.numberOfPlayersSelected = 2;
    [self performSegueWithIdentifier:@"NumberOfPlayersToGameSetupViewController" sender:sender];
}

- (IBAction)twoPlayerButtonPressed:(id)sender {
    self.numberOfPlayersSelected = 2;
    [self performSegueWithIdentifier:@"NumberOfPlayersToGameSetupViewController" sender:sender];
}

- (IBAction)threePlayerButtonPressed:(id)sender {
    self.numberOfPlayersSelected = 3;
    [self performSegueWithIdentifier:@"NumberOfPlayersToGameSetupViewController" sender:sender];
}

- (IBAction)fourPlayerButtonPressed:(id)sender {
    self.numberOfPlayersSelected = 4;
    [self performSegueWithIdentifier:@"NumberOfPlayersToGameSetupViewController" sender:sender];
}

- (IBAction)fivePlayerButtonPressed:(id)sender {
    self.numberOfPlayersSelected = 5;
    [self performSegueWithIdentifier:@"NumberOfPlayersToGameSetupViewController" sender:sender];
}

- (void) settingsTapped{
    [self performSegueWithIdentifier:@"NumberOfPlayersToSettingsSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"NumberOfPlayersToGameSetupViewController"]) {
        GameSetupViewController *gameSetupVC = (GameSetupViewController *) (segue.destinationViewController);
        gameSetupVC.numberOfPlayersForGame = self.numberOfPlayersSelected;
    }
}




@end
