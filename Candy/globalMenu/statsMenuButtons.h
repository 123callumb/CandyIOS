//
//  statsMenuButtons.h
//  Candy
//
//  Created by Callum Beckwith on 28/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface statsMenuButtons : SKSpriteNode
+(void)addStatsButton: (SKSpriteNode*)s;

+(void)onStatsButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk;
@end
