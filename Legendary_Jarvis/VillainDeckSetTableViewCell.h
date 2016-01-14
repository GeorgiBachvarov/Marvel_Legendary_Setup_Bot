//
//  VillainDeckSetTableViewCell.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/13/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderedLabel.h"

@interface VillainDeckSetTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *villainDeckImage;
@property (weak, nonatomic) IBOutlet BorderedLabel *villainDeckDisplayNameLabel;

@end
