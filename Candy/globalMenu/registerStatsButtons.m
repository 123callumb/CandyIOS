//
//  registerStatsButtons.m
//  Candy
//
//  Created by Callum Beckwith on 28/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "registerStatsButtons.h"
#import "statsMenuButtons.h"
#import "playerStatsMenu.h"

@implementation registerStatsButtons
+(void)registerStatsButtons: (SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    [statsMenuButtons onStatsButtonPress:(SKSpriteNode*)n scene:s];
    [playerStatsMenu onDoneTouch:(SKSpriteNode*)n scene:s];
    [playerStatsMenu onPlayerButtonTouch:s location:p node:n];
}
@end
