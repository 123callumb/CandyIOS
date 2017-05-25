//
//  tapCombo.m
//  Candy
//
//  Created by Callum Beckwith on 21/05/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "tapCombo.h"
#import "fiftyTapBonus.h"
#import "specialsData.h"

@implementation tapCombo

float comboTimer = 0;
int comboNumber = 0;
float comboMultiplier = 0;
int comboReward = 0;

+(void)startTapTimerCountDown:(SKScene*)onScene {
    comboTimer = 1 + (comboNumber/300);
    comboNumber++;
    comboReward++;
    comboMultiplier = 1.00 + (float)(comboNumber)/1000;
    //NSLog(@"%f", comboMultiplier);
    [self initiateComboBar:onScene];
    
    //NSLog(@"Combo Of: %d", comboNumber);
    SKAction *timer = [SKAction waitForDuration:1];
    SKAction *setTimer = [SKAction runBlock:^{
        
        if(comboTimer > 0){
            comboTimer = comboTimer - 1;
            //NSLog(@"%f", comboTimer);
        }else {
            [onScene removeActionForKey:@"tapCombo"];
            //NSLog(@"[Combo timer removed]");
            comboNumber = 0;
            comboMultiplier = 0;
            comboReward = 0;
            [self removeComboBar:onScene];
        }
        
    }];
    SKAction *seq = [SKAction sequence:@[timer, setTimer]];
    SKAction *rep = [SKAction repeatActionForever:seq];
   
    [onScene runAction:rep withKey:@"tapCombo"];
}

+(void)initiateComboBar:(SKScene*)s {
    
    SKSpriteNode *bar = (SKSpriteNode*)[s childNodeWithName:@"comboBar"];
    
    if(bar == nil){
        SKSpriteNode *comboBar = [SKSpriteNode spriteNodeWithImageNamed:@"bonusBar"];
        comboBar.position = CGPointMake(0, s.frame.size.height/2.2);
        [comboBar setScale:0.4];
        [comboBar setName:@"comboBar"];
        SKLabelNode *multiplierText = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"%.02f", comboMultiplier]];
        multiplierText.fontName = @"Coder's-Crux";
        multiplierText.fontSize = 120;
        multiplierText.fontColor = [UIColor blackColor];
        multiplierText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        multiplierText.position = CGPointMake(comboBar.frame.size.width/3, -comboBar.frame.size.height/3);
        multiplierText.name = @"comboText";
        
        SKSpriteNode *rewardBar = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake((comboBar.size.width/250), comboBar.size.height/2)];
        rewardBar.position = CGPointMake(-comboBar.frame.size.width - comboBar.frame.size.width/75, 0);
        rewardBar.name = @"rewardBar";
        rewardBar.anchorPoint = CGPointMake(0, 0.5);
        rewardBar.zPosition = comboBar.zPosition - 1;
        
        [comboBar addChild:rewardBar];
        [comboBar setZPosition:4];
        [comboBar addChild:multiplierText];
        
        [s addChild:comboBar];
        
        SKAction *slideDown = [SKAction moveToY:s.frame.size.height/2.6 duration:0.3];
        [comboBar runAction:slideDown];
        
    }else {
        
        SKLabelNode *multiText = (SKLabelNode*)[bar childNodeWithName:@"comboText"];
        [multiText setText:[NSString stringWithFormat:@"%.02f", (comboMultiplier + [specialsData getSpecialsMultiplier] - 1)]];
        SKSpriteNode *rewardBar = (SKSpriteNode*)[bar childNodeWithName:@"rewardBar"];
        [rewardBar setSize:CGSizeMake((bar.frame.size.width/250) * comboReward, rewardBar.frame.size.height)];
        
        if(comboReward >= 250){
            comboReward = 0;
            [rewardBar setSize:CGSizeMake((bar.frame.size.width/250) * comboReward, rewardBar.frame.size.height)];
            SKAction *glow = [SKAction runBlock:^{[bar setTexture:[SKTexture textureWithImageNamed:@"bonusBarGlow"]];}];
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *glowSeq = [SKAction sequence:@[glow, wait]];
            [bar runAction:glowSeq completion:^{[bar setTexture:[SKTexture textureWithImageNamed:@"bonusBar"]];}];
            [fiftyTapBonus reward:s];
        }
    }
}
+(void)removeComboBar:(SKScene*)s {
    
    SKSpriteNode *bar = (SKSpriteNode*)[s childNodeWithName:@"comboBar"];
    
    if(bar != nil){
        SKAction *slideUp = [SKAction moveToY:s.frame.size.height/2.2 duration:0.3];
        [bar runAction:slideUp completion:^{
            [bar removeFromParent];
        }];
    }

}
+(float)getCurrentComboMultiplier {
    return comboMultiplier;
}
+(void)resetComboData {
    comboNumber = 0;
    comboMultiplier = 0;
    comboReward = 0;
    comboTimer = 0;
}
@end
