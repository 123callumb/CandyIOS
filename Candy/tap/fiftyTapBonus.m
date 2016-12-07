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

@implementation fiftyTapBonus
int tapCollector = 0;
+(void)tapCollector:(SKScene*)s {
    tapCollector++;
    if(tapCollector >= 50){
        int lowerBound = 1;
        int upperBound = 5;
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        tapCollector = 0;
        NSLog(@"random %d", rndValue);
        [self createRandomSweetBonus:rndValue scene:s];
    }
}
+(void)createRandomSweetBonus:(int)sweetSlotID scene:(SKScene*)s {
    SKSpriteNode *sweet = [defaultSweet addSweet:s pos:CGPointMake(0, 0) slotID:sweetSlotID];
    sweet.alpha = 0;
    sweet.xScale = 0.3;
    sweet.yScale = 0.3;
    sweet.name = @"bonusSweet";
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
    if([obj.name isEqualToString:@"bonusSweet"]){
        int lowerBound = 5;
        int upperBound = 70;
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        [coinSpawner coinExplosion:obj scene:s coinAmount:rndValue];

    }
}
@end
