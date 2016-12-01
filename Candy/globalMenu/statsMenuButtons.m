//
//  statsMenuButtons.m
//  Candy
//
//  Created by Callum Beckwith on 28/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "statsMenuButtons.h"
#import "playerStatsMenu.h"
#import "mainTransition.h"

@implementation statsMenuButtons

+(void)addStatsButton: (SKSpriteNode*)s {
    SKSpriteNode *statsButton = [SKSpriteNode spriteNodeWithImageNamed:@"playerStatsButton"];
    statsButton.position = CGPointMake(0, -s.frame.size.height/1.3);
    statsButton.name = @"statsMenuStatsButton";

    SKSpriteNode *mapButton = [SKSpriteNode spriteNodeWithImageNamed:@"mapButton"];
    mapButton.position = CGPointMake(0, -s.frame.size.height/10);
    mapButton.name = @"statsMenuMapButton";
    
    SKSpriteNode *coinPackButton = [SKSpriteNode spriteNodeWithImageNamed:@"coinPackButton"];
    coinPackButton.position = CGPointMake(0, s.frame.size.height/1.8);
    coinPackButton.name = @"statsMenuCoinPackButton";
    
    [s addChild:mapButton];
    [s addChild:coinPackButton];
    [s addChild:statsButton];
}
+(void)onStatsButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk {
    if([s.name isEqualToString:@"statsMenuStatsButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        [playerStatsMenu createPStatsMenu:sk];
    }
    if([s.name isEqualToString:@"statsMenuMapButton"]){
        SKAction *block = [SKAction runBlock:^{
            [mainTransition switchScene:sk sceneTwo:@"mainMap" Transition:[SKTransition doorsCloseVerticalWithDuration:0.3]];
        }];
        [self buttonAnimation:s action:block];
    }
    if([s.name isEqualToString:@"statsMenuCoinPackButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
    }
}

+(void)buttonAnimation: (SKSpriteNode*)s action:(SKAction*)r {
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.15];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.15];
    
    [s runAction:shrink completion:^{
        [s runAction:grow completion:^{
            [s runAction:r];
        }];
    }];
}
@end
