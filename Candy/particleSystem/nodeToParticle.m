//
//  nodeToParticle.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "nodeToParticle.h"

@implementation nodeToParticle
+(void)particleFlyAnimation: (SKSpriteNode*)n scene:(SKScene *)s scaleNo:(float)scale;{
   SKSpriteNode *one = n;
    [self applyImpluse:one scene:s scaleNo:scale];
   
    
}
+(void)applyImpluse: (SKSpriteNode*)l1 scene:(SKScene*)s scaleNo:(float)scale; {
    [s addChild:l1];
    l1.xScale = scale;
    l1.yScale = scale;
    
    
    l1.physicsBody = [SKPhysicsBody bodyWithTexture:l1.texture size:l1.texture.size];
    
    int lowerBoundX = -500;
    int upperBoundX = 500;
    int rndValueX = lowerBoundX + arc4random() % (upperBoundX - lowerBoundX);

    SKAction *leftFly = [SKAction applyImpulse:CGVectorMake(rndValueX,600) duration:0.1];
    SKAction *killTimer = [SKAction fadeOutWithDuration:0.1];
    
    [l1 runAction:leftFly completion:^{
        [l1 runAction:killTimer completion:^{
            [l1 removeFromParent];

        }];
    }];

}
@end
