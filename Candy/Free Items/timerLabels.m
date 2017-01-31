//
//  timerLabels.m
//  Candy
//
//  Created by Callum Beckwith on 31/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "timerLabels.h"
#import "fsTimerData.h"

@implementation timerLabels
+(void)addGemLabel: (SKSpriteNode*)s {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    label.fontSize = 45;
    label.fontColor = [SKColor blackColor];
    label.position = CGPointMake(-s.frame.size.width/3.5, 0);
    label.zPosition = 2;
    label.name = @"gemLabel";
    label.zRotation = M_PI_4;
    
    if([fsTimerData getGemTimeLeft] <= 0){
        label.text = @"REDEEM NOW!";
    }else {
        label.text = [NSString stringWithFormat:@"%dmin Cooldown", [fsTimerData getGemTimeLeft]];
    }
    
    [s addChild:label];
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.8];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.8];
    SKAction *seqSG = [SKAction sequence:@[shrink, grow]];
    SKAction *repeat = [SKAction repeatActionForever:seqSG];
    [label runAction:repeat];
}
+(void)addCoinLabel: (SKSpriteNode*)s {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    label.fontSize = 45;
    label.fontColor = [SKColor blackColor];
    label.position = CGPointMake(-s.frame.size.width/3.5, 0);
    label.zPosition = 2;
    label.name = @"coinLabel";
    label.zRotation = M_PI_4;
    
    if([fsTimerData getCoinTimeLeft] <= 0){
        label.text = @"REDEEM NOW!";
    }else {
        label.text = [NSString stringWithFormat:@"%dsec Cooldown", [fsTimerData getCoinTimeLeft]];
    }
    
    [s addChild:label];
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.8];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.8];
    SKAction *seqSG = [SKAction sequence:@[shrink, grow]];
    SKAction *repeat = [SKAction repeatActionForever:seqSG];
    [label runAction:repeat];
}
+(void)addMiniGemLabel: (SKSpriteNode*)s {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    label.fontSize = 45;
    label.fontColor = [SKColor blackColor];
    label.position = CGPointMake(-s.frame.size.width/3.5, 0);
    label.zPosition = 2;
    label.name = @"miniGemLabel";
    label.zRotation = M_PI_4;
    
    if([fsTimerData getMiniGemTimeLeft] <= 0){
        label.text = @"REDEEM NOW!";
    }else {
        label.text = [NSString stringWithFormat:@"%dsec Cooldown", [fsTimerData getMiniGemTimeLeft]];
    }
    
    [s addChild:label];
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.8];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.8];
    SKAction *seqSG = [SKAction sequence:@[shrink, grow]];
    SKAction *repeat = [SKAction repeatActionForever:seqSG];
    [label runAction:repeat];
}
+(void)updateLabels: (SKScene*)s {
    SKSpriteNode *gemBox = (SKSpriteNode*)[s childNodeWithName:@"gemButton"];
    SKLabelNode *gem = (SKLabelNode*)[gemBox childNodeWithName:@"gemLabel"];
    if([fsTimerData getGemTimeLeft] <= 0){
        gem.text = @"REDEEM NOW!";
    }else {
        gem.text = [NSString stringWithFormat:@"%dmin Cooldown", [fsTimerData getGemTimeLeft]];
    }
    
    SKSpriteNode *miniGemBox = (SKSpriteNode*)[s childNodeWithName:@"miniGemButton"];
    SKLabelNode *minigem = (SKLabelNode*)[miniGemBox childNodeWithName:@"miniGemLabel"];
    if([fsTimerData getMiniGemTimeLeft] <= 0){
        minigem.text = @"REDEEM NOW!";
    }else {
        minigem.text = [NSString stringWithFormat:@"%dsec Cooldown", [fsTimerData getMiniGemTimeLeft]];
    }
    
    SKSpriteNode *coinBox = (SKSpriteNode*)[s childNodeWithName:@"coinsButton"];
    SKLabelNode *coin = (SKLabelNode*)[coinBox childNodeWithName:@"coinLabel"];
    if([fsTimerData getCoinTimeLeft] <= 0){
        coin.text = @"REDEEM NOW!";
    }else {
        coin.text = [NSString stringWithFormat:@"%dsec Cooldown", [fsTimerData getCoinTimeLeft]];
    }
}
@end
