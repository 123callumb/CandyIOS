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
#import "tutorialMessages.h"
#import "trendsMain.h"
#import "spinData.h"

@implementation statsMenuButtons

+(void)addStatsButton: (SKSpriteNode*)s {
    SKSpriteNode *playerButton = [SKSpriteNode spriteNodeWithImageNamed:@"playerStatsIcon"];
    playerButton.position = CGPointMake(s.frame.size.width/2, s.frame.size.height/9);
    playerButton.name = @"statsMenuStatsButton";
    
    SKSpriteNode *sweetInventoryButton = [SKSpriteNode spriteNodeWithImageNamed:@"sweetMenuButton"];
    sweetInventoryButton.position = CGPointMake(-s.frame.size.width/2, s.frame.size.height/9);
    sweetInventoryButton.name = @"sweetInvButton";

    SKSpriteNode *mapButton = [SKSpriteNode spriteNodeWithImageNamed:@"freeItemsButton"];
    mapButton.position = CGPointMake(-s.frame.size.width/2, s.frame.size.height/1.7);
    mapButton.name = @"freeItemsButton";
    
    SKSpriteNode *sweetTrends = [SKSpriteNode spriteNodeWithImageNamed:@"sweetTrendsButton"];
    sweetTrends.position = CGPointMake(s.frame.size.width/2, -s.frame.size.height/1.21);
    sweetTrends.name = @"sweetTrendsButton";
    
    SKSpriteNode *coinPackButton = [SKSpriteNode spriteNodeWithImageNamed:@"itemPacksButton"];
    coinPackButton.position = CGPointMake(s.frame.size.width/2, s.frame.size.height/1.7);
    coinPackButton.name = @"itemPacksButton";
    
    SKSpriteNode *coinStoreButton = [SKSpriteNode spriteNodeWithImageNamed:@"coinStoreButton"];
    coinStoreButton.position = CGPointMake(-s.frame.size.width/2, -s.frame.size.height/2.8);
    coinStoreButton.name = @"statsMenuCoinStoreButton";
    
    SKSpriteNode *gemButton = [SKSpriteNode spriteNodeWithImageNamed:@"gemButton"];
    gemButton.position = CGPointMake(s.frame.size.width/2, -s.frame.size.height/2.8);
    gemButton.name = @"statsMenuGemButton";
    
    NSString *dailySpinTexture;
    
    if([spinData isEligibleForDailySpin]){
        dailySpinTexture = @"dailySpinButton";
    }else {
        dailySpinTexture = @"dailySpinButtonTaken";
    }
    
    SKSpriteNode *dailySpin = [SKSpriteNode spriteNodeWithImageNamed:dailySpinTexture];
    dailySpin.position = CGPointMake(-s.frame.size.width/2, -s.frame.size.height/1.21);
    dailySpin.name = @"dailySpinButton";
    
    [s addChild:mapButton];
    [s addChild:coinPackButton];
    [s addChild:playerButton];
    [s addChild:sweetInventoryButton];
    [s addChild:gemButton];
    [s addChild:coinStoreButton];
    [s addChild:sweetTrends];
    [s addChild:dailySpin];
}
+(void)onStatsButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk view:(UIView*)v {
    if([s.name isEqualToString:@"statsMenuStatsButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        [playerStatsMenu createPStatsMenu:sk];
    }
    if([s.name isEqualToString:@"freeItemsButton"]){
        [mainTransition switchScene:sk sceneTwo:@"freeItems" Transition:[SKTransition fadeWithDuration:0.3]];
        [self buttonAnimation:s action:[SKAction runBlock:^{}]];
    }
    if([s.name isEqualToString:@"statsMenuCoinStoreButton"]){
        SKAction *block = [SKAction runBlock:^{
            [mainTransition switchScene:sk sceneTwo:@"coinStore" Transition:[SKTransition fadeWithDuration:0.3]];
            [tutorialMessages firstTimeStoreButton:v];
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
            [tutorialMessages firstTimeSweetInvButton:v];
        }];
        [self buttonAnimation:s action:block];

    }
    if([s.name isEqualToString:@"statsMenuGemButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        [gemGemeratorGui createGemMenu:sk];
        [tutorialMessages firstTimeGemeratorButton:v];
    }
    if([s.name isEqualToString:@"dailySpinButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        if([spinData isEligibleForDailySpin]){
            [mainTransition switchScene:sk sceneTwo:@"dailySpin" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:0.3]];
        }else {
            [tutorialMessages spinTimeLeft:v];
        }
    }
    if([s.name isEqualToString:@"sweetTrendsButton"]){
        SKAction *block = [SKAction runBlock:^{}];
        [self buttonAnimation:s action:block];
        [trendsMain createTrendsMenu:v];
        [tutorialMessages firstTimeTrends:v];

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
