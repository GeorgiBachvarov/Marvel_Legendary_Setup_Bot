//
//  SettingsViewController.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/20/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *banCardsButtonCenterXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ownedExpansionsCenterXConstraint;

- (IBAction)banCardsTapped:(id)sender;
- (IBAction)expansionsTapped:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateAppearanceWithCompletion:nil];
    });
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self animateDisappearanceWithCompletion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}

- (void) animateAppearanceWithCompletion:(void (^)()) completion {
    
    self.banCardsButtonCenterXConstraint.constant = 0;
    self.ownedExpansionsCenterXConstraint.constant = 0;
    [UIView animateWithDuration:0.4 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void) animateDisappearanceWithCompletion:(void (^)()) completion{
    
    self.banCardsButtonCenterXConstraint.constant = -350;
    self.ownedExpansionsCenterXConstraint.constant = 350;
    [UIView animateWithDuration:0.4 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (IBAction)banCardsTapped:(id)sender {
    [self animateDisappearanceWithCompletion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"SettingsToFilterCardsSegue" sender:nil];
    });
}

- (IBAction)expansionsTapped:(id)sender {
    [self animateDisappearanceWithCompletion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"SettingsToExpansionsSegue" sender:nil];
    });
    
}
@end
