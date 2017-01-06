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
#import "sweetInventoryUI.h"
#import "gemGemeratorGui.h"

@implementation statsMenuButtons

+(void)addStatsButton: (SKSpriteNode*)s {
    SKSpriteNode *playerButton = [SKSpriteNode spriteNodeWithImageNamed:@"playerStatsIcon"];
    playerButton.position = CGPointMake(s.frame.size.width/2, s.frame.size.height/9);
    playerButton.name = @"statsMenuStatsButton";
    
    SKSpriteNode *sweetInventoryButton = [SKSpriteNode spriteNodeWithImageNamed:@"sweetMenuButton"];
    sweetInventoryButton.position = CGPointMake(-s.frame.size.width/2, s.frame.size.height/9);
    sweetInventoryButton.name = @"sweetInvButton";

    SKSpriteNode *mapButton = [SKSpriteNode spriteNodeWithImageNamed:@"mapButtonSmaller"];
    mapButton.position = CGPointMake(0, -s.frame.size.height/1.21);
    mapButton.name = @"statsMenuMapButton";
    
    SKSpriteNode *coinPackButton = [SKSpriteNode spriteNodeWithImageNamed:@"coinPackButton"];
    coinPackButton.position = CGPointMake(0, s.frame.size.height/1.7);
    coinPackButton.name = @"statsMenuCoinPackButton";
    
    SKSpriteNode *coinStoreButton = [SKSpriteNode spriteNodeWithImageNamed:@"coinStoreButton"];
    coinStoreButton.position = CGPointMake(-s.frame.size.width/2, -s.frame.size.height/2.8);
    coinStoreButton.name = @"statsMenuCoinStoreButton";
    
    SKSpriteNode *gemButton = [SKSpriteNode spriteNodeWithImageNamed:@"gemButton"];
    gemButton.position = CGPointMake(s.frame.size.width/2, -s.frame.size.height/2.8);
    gemButton.name = @"statsMenuGemButton";
    
    [s addChild:mapButton];
    [s addChild:coinPackButton];
    [s addChild:playerButton];
    [s addChild:sweetInventoryButton];
    [s addChild:gemButton];
    [s addChild:coinStoreButton];
}
+(void)onStatsButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk view:(UIView*)v {
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
    if([s.name isEqualToString:@"statsMenuCoinStoreButton"]){
        SKAction *block = [SKAction runBlock:^{
            [mainTransition switchScene:sk sceneTwo:@"coinStore" Transition:[SKTransition fadeWithDuration:0.3]];
        }];
        [self buttonAnimation:s action:block];
    }
    if([s.name isEqualToString:@"statsMenuCoinPackButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
    }
    if([s.name isEqualToString:@"sweetInvButton"]){
        SKAction *block = [SKAction runBlock:^{
            [sweetInventoryUI showSweetInventoryUI:v];
        }];
        [self buttonAnimation:s action:block];
    }
    if([s.name isEqualToString:@"statsMenuGemButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        [gemGemeratorGui createGemMenu:sk];
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
