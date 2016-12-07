//
//  coinSpawner.m
//  Candy
//
//  Created by Callum Beckwith on 03/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "coinSpawner.h"
#import "money.h"
#import "inventory.h"

@implementation coinSpawner
+(void)spriteToSpriteSpawner: (SKSpriteNode*)s1 sprite2:(SKSpriteNode*)s2 scene:(SKScene*)s {
    SKSpriteNode *coin = [SKSpriteNode spriteNodeWithImageNamed:@"coin"];
    coin.position = s1.position;
    coin.xScale = 0.4;
    coin.yScale = 0.4;
    coin.alpha = 0;
    
    SKAction *fadeIn = [SKAction fadeInWithDuration:0.2];
    SKAction *moveInDirectionOfSprite = [SKAction moveTo:s2.position duration:0.6];
    SKAction *fadeCoin = [SKAction fadeInWithDuration:0.4];
    SKAction *shrinkCoin = [SKAction scaleBy:0.5 duration:0.6];
    
    [s addChild:coin];
    [coin runAction:fadeIn completion:^{
        [coin runAction:fadeCoin];
    }];
    [coin runAction:shrinkCoin];
    [coin runAction:moveInDirectionOfSprite completion:^{
        [coin removeFromParent];
    }];
}
+(void)coinExplosion: (SKSpriteNode*)s1 scene:(SKScene*)s coinAmount:(int)coinNo {
    
    if([s1.name isEqualToString:@"bonusSweet"]){
        s1.name = @"bonusUsed";
    
        SKAction *fadeOutt = [SKAction fadeOutWithDuration:0.2];
        SKAction *sizeDown = [SKAction scaleBy:1.25 duration:0.2];
    
        [s1 runAction:fadeOutt completion:^{
            [s1 removeFromParent];
        }];
        [s1 runAction:sizeDown];
    }
    
    for(int i = 1; i <= coinNo; i++){
        SKSpriteNode *coin = [SKSpriteNode spriteNodeWithImageNamed:@"coin"];
        coin.position = s1.position;
        coin.xScale = 0.4;
        coin.yScale = 0.4;
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
        int addedBal = [inventory slotCalculation:1] + [inventory slotCalculation:2] + [inventory slotCalculation:3] + [inventory slotCalculation:4];
        [money addBalance:addedBal];
    }
}
@end
