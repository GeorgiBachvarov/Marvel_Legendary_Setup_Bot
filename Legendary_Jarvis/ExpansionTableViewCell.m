//
//  ExpansionTableViewCell.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/20/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "ExpansionTableViewCell.h"

@implementation ExpansionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (IBAction)isOwnedSwitchValueChanged:(id)sender {
    UISwitch *isOwnedSwitch = (UISwitch *) sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(expansionTableViewCell:valueChanged:)]) {
        [self.delegate expansionTableViewCell:self valueChanged:isOwnedSwitch.isOn];
    }
}

@end
