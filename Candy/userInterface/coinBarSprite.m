//
//  coinBarSprite.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "coinBarSprite.h"

@implementation coinBarSprite
+(void)addCoinBar:(SKScene *)s {
    SKSpriteNode *coinBar = [SKSpriteNode spriteNodeWithImageNamed:@"coinBar"];
    coinBar.anchorPoint = CGPointMake(0.5, 0.5);
    coinBar.position = CGPointMake(-s.frame.size.width/4.4, s.frame.size.height/2.3);
    coinBar.xScale = 0.45;
    coinBar.yScale = 0.42;
    coinBar.zPosition = 11;
    [s addChild:coinBar];
}
@end
