//
//  nodeToParticle.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "nodeToParticle.h"

@implementation nodeToParticle
+(void)particleFlyAnimation: (SKSpriteNode*)n scene:(SKScene *)s{
   // SKSpriteNode *one = n;
   // [self applyImpluse:one scene:s];
   
    
}
+(void)applyImpluse: (SKSpriteNode*)l1 scene:(SKScene*)s {
    [s addChild:l1];
    l1.xScale = 0.3;
    l1.yScale = 0.3;
    
    
    l1.physicsBody = [SKPhysicsBody bodyWithTexture:l1.texture size:l1.texture.size];
    
    int lowerBoundX = -500;
    int upperBoundX = 500;
    int rndValueX = lowerBoundX + arc4random() % (upperBoundX - lowerBoundX);

    SKAction *leftFly = [SKAction applyImpulse:CGVectorMake(rndValueX,600) duration:0.2];
    SKAction *killTimer = [SKAction waitForDuration:2];
    
    [l1 runAction:leftFly completion:^{
        [l1 runAction:killTimer completion:^{
            [l1 removeFromParent];

        }];
    }];

}
@end
