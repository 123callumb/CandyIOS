//
//  gemAnimations.m
//  Candy
//
//  Created by Callum Beckwith on 11/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemAnimations.h"
#import "gems.h"
#import "bonusAmounts.h"

@implementation gemAnimations
+(void)miniGemExplosion: (SKSpriteNode*)s1 scene:(SKScene*)s {
    
    int miniGemAmount = [bonusAmounts calculateMiniGemReturn];
    
    if([s1.name isEqualToString:@"bonusPresent"]){
        s1.name = @"bonusUsed";
        
        SKAction *fadeOutt = [SKAction fadeOutWithDuration:0.2];
        SKAction *sizeDown = [SKAction scaleBy:1.25 duration:0.2];
        
        [s1 runAction:fadeOutt completion:^{
            [s1 removeFromParent];
        }];
        [s1 runAction:sizeDown];
    }
    
    for(int i = 1; i <= miniGemAmount; i++){
        SKSpriteNode *coin = [SKSpriteNode spriteNodeWithImageNamed:@"miniGems"];
        coin.position = s1.position;
        coin.xScale = 0.9;
        coin.yScale = 0.9;
        coin.alpha = 0;
        
        SKAction *fadeCoin = [SKAction fadeInWithDuration:0.2];
        SKAction *fadeIn = [SKAction fadeInWithDuration:0.1];
        
        int lowerBoundX = -300;
        int upperBoundX = 300;
        int rndValueX = lowerBoundX + arc4random() % (upperBoundX - lowerBoundX);
        
        int lowerBoundY = -300;
        int upperBoundY = 300;
        int rndValueY = lowerBoundY + arc4random() % (upperBoundY - lowerBoundY);
        
        [s addChild:coin];
        SKAction *leftFly = [SKAction moveBy:CGVectorMake(rndValueX,rndValueY) duration:0.3];
        SKAction *shrinkCoin = [SKAction scaleBy:0.5 duration:0.3];
        
        [coin runAction:leftFly];
        [coin runAction:fadeIn completion:^{
            [coin runAction:fadeCoin completion:^{
                [coin removeFromParent];
            }];
        }];
        [coin runAction:shrinkCoin];
        [gems addMiniGems:miniGemAmount];
    }
}

@end
