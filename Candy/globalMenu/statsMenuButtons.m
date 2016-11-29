//
//  statsMenuButtons.m
//  Candy
//
//  Created by Callum Beckwith on 28/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "statsMenuButtons.h"

@implementation statsMenuButtons
+(void)addStatsButton: (SKSpriteNode*)s {
    SKSpriteNode *statsButton = [SKSpriteNode spriteNodeWithImageNamed:@"playerStatsButton"];
    statsButton.position = CGPointMake(0, -s.frame.size.height/1.275);
    statsButton.name = @"statsMenuStatsButton";

    
    [s addChild:statsButton];
}
+(void)onStatsButtonPress:(SKSpriteNode*)s {
    if([s.name isEqualToString:@"statsMenuStatsButton"]){
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
