//
//  fiftyTapBonus.m
//  Candy
//
//  Created by Callum Beckwith on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "fiftyTapBonus.h"
#import "defaultSweet.h"
#import "coinSpawner.h"
#import "box1.h"
#import "gems.h"
#import "gemAnimations.h"

@implementation fiftyTapBonus
int tapCollector = 0;
+(void)tapCollector:(SKScene*)s {
    tapCollector++;
    if(tapCollector >= 50){
        int lowerBound = 0;
        int upperBound = (int)[box1 getSlotsUnlocked];
        int rndValue = lowerBound + (int)arc4random() % (upperBound - lowerBound);
        tapCollector = 0;
        NSLog(@"random %d", rndValue);
        [self createRandomSweetBonus:rndValue scene:s];
    }
}
+(void)createRandomSweetBonus:(int)sweetSlotID scene:(SKScene*)s {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:@"tempPresent"];
    sweet.alpha = 0;
    sweet.xScale = 0.2;
    sweet.yScale = 0.2;
    sweet.name = @"bonusPresent";
    [s addChild:sweet];
    SKAction *fadeIn = [SKAction fadeInWithDuration:0.2];
    SKAction *scaleIn = [SKAction scaleTo:0.6 duration:0.2];
    [sweet runAction:scaleIn];
    [sweet runAction:fadeIn];
    sweet.physicsBody = [SKPhysicsBody bodyWithTexture:sweet.texture size:sweet.frame.size];
    int lowerBound = -40;
    int upperBound = 40;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    SKAction *lauch = [SKAction applyImpulse:CGVectorMake(rndValue, 100) duration:0.5];
    [sweet runAction:lauch];
}
+(void)onTouchofBonus:(SKSpriteNode*)obj scene:(SKScene*)s {
    if([obj.name isEqualToString:@"bonusPresent"]){
        int lowerBound = 1;
        int upperBound = 100;
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        if(rndValue > 96){
            [gemAnimations miniGemExplosion:obj scene:s];
        }else {
            [coinSpawner coinExplosion:obj scene:s];
        }
    }
}

@end
