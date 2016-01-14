//
//  GradientTopBar.m
//  Legendary_Jarvis
//
//  Created by Georgi Bachvarov on 1/14/16.
//  Copyright © 2016 Georgi Bachvarov. All rights reserved.
//

#import "GradientTopBar.h"

@implementation GradientTopBar

- (void)awakeFromNib{
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.colors = @[ (id)[UIColor blackColor].CGColor , (id)[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor , (id)[UIColor clearColor].CGColor ];
    layer.startPoint = CGPointMake(0.5, 0);
    layer.endPoint = CGPointMake(0.5, 1);
}

+ (Class)layerClass{
    return [CAGradientLayer class];
}

@end
