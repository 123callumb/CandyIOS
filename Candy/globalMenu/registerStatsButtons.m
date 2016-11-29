//
//  registerStatsButtons.m
//  Candy
//
//  Created by Callum Beckwith on 28/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "registerStatsButtons.h"
#import "statsMenuButtons.h"

@implementation registerStatsButtons
+(void)registerStatsButtons: (SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    [statsMenuButtons onStatsButtonPress:(SKSpriteNode*)n];
}
@end
