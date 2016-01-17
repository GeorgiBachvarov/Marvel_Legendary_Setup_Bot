//
//  FilterCardsTableHeaderView.h
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/17/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterCardsTableHeaderView;
@protocol FilterCardsTableHeaderViewDelegate <NSObject>

- (void) addButtonTappedInFilterCardsTableHeaderView:(FilterCardsTableHeaderView *) headerView;

@end

@interface FilterCardsTableHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, weak) id <FilterCardsTableHeaderViewDelegate> delegate;

@end
