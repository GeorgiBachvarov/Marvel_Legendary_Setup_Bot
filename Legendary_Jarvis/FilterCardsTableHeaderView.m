//
//  FilterCardsTableHeaderView.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/17/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "FilterCardsTableHeaderView.h"

@interface FilterCardsTableHeaderView ()

@end

@implementation FilterCardsTableHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addButtonTapped{
    [self.delegate addButtonTappedInFilterCardsTableHeaderView:self];
}

@end
