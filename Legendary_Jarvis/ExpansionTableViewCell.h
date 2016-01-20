//
//  ExpansionTableViewCell.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/20/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpansionTableViewCell;
@protocol ExpansionTableViewCellDelegate <NSObject>

@optional
- (void) expansionTableViewCell: (ExpansionTableViewCell *) expansionTableViewCell valueChanged:(BOOL) newValue;

@end

@interface ExpansionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *isOwnedSwitch;
@property (weak, nonatomic) IBOutlet UILabel *expansionTitleLabel;
@property (weak, nonatomic) id <ExpansionTableViewCellDelegate> delegate;

@end
