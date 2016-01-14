//
//  VillainDeckSetTableViewCell.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/13/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "VillainDeckSetTableViewCell.h"

@interface VillainDeckSetTableViewCell ()


@end

@implementation VillainDeckSetTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.villainDeckImage.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:1].CGColor;
    self.villainDeckImage.layer.borderWidth = 3.f;
    self.villainDeckImage.layer.cornerRadius = self.villainDeckImage.bounds.size.width/2;
    self.villainDeckImage.clipsToBounds = YES;
}

@end
