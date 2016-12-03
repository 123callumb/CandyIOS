//
//  coinSpawner.m
//  Candy
//
//  Created by Callum Beckwith on 03/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "coinSpawner.h"

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
@end
