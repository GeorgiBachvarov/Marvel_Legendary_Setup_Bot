//
//  BorderedLabel.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/13/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "BorderedLabel.h"

@implementation BorderedLabel

- (void)awakeFromNib{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 3.f;
    self.font = [UIFont fontWithName:@"Comic Book" size:20];
}

- (CGSize)intrinsicContentSize{
    CGSize superSize = [super intrinsicContentSize];
    return CGSizeMake(superSize.width+50, superSize.height+15);
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    return CGRectInset(self.bounds , 10 , 0 );
}

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect: CGRectInset(self.bounds, 10, 0)];
}

@end
