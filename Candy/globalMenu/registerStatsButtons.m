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
#import "packetUIButtons.h"

@implementation registerStatsButtons
+(void)registerStatsButtons: (SKScene*)s location:(CGPoint)p node:(SKNode*)n view:(UIView*)v {
    [statsMenuButtons onStatsButtonPress:(SKSpriteNode*)n scene:s view:v];
    [playerStatsMenu onDoneTouch:(SKSpriteNode*)n scene:s];
    [playerStatsMenu onPlayerButtonTouch:s location:p node:n];
    [packetUIButtons onButtonPress:(SKSpriteNode*)n scene:s];
}
@end
