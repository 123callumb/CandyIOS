//
//  uiGemLabel.m
//  Candy
//
//  Created by Callum Beckwith on 19/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "uiGemLabel.h"
#import "gems.h"

@implementation uiGemLabel

+(void)addGemLabel: (UIView*)v rectSize:(CGRect)rS fontSize:(float)fS {
    UILabel *gemLabel = [[UILabel alloc] initWithFrame:rS];
    [gemLabel setFont:[UIFont fontWithName:@"Coder's-Crux" size:fS]];
    [gemLabel setText:[gems getGemsAsString]];
    [gemLabel setTextAlignment:NSTextAlignmentCenter];
    [gemLabel setBackgroundColor:[UIColor clearColor]];
    [v addSubview:gemLabel];
}

@end
