//
//  nodeToParticle.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "nodeToParticle.h"
#import "determineSweetTap.h"
#import "coinSpawner.h"

@implementation nodeToParticle
+(void)particleFlyAnimation: (SKSpriteNode*)n scene:(SKScene *)s scaleNo:(float)scale;{
   SKSpriteNode *one = n;
    [self applyImpluse:one scene:s scaleNo:scale];
   
    
}
+(void)applyImpluse: (SKSpriteNode*)l1 scene:(SKScene*)s scaleNo:(float)scale; {
    
    float fadeTime = 0.1;
    
    
    [s addChild:l1];
    l1.xScale = scale;
    l1.yScale = scale;
    
    
   // l1.physicsBody = [SKPhysicsBody bodyWithTexture:l1.texture size:l1.texture.size];
    
    int lowerBoundX = -250;
    int upperBoundX = 250;
    int rndValueX = lowerBoundX + arc4random() % (upperBoundX - lowerBoundX);
    
    int lowerBoundY = -250;
    int upperBoundY = 250;
    int rndValueY = lowerBoundY + arc4random() % (upperBoundY - lowerBoundY);


    SKAction *leftFly = [SKAction moveBy:CGVectorMake(rndValueX,rndValueY) duration:0.3];
    SKAction *waitTillFade = [SKAction waitForDuration:0.2];
    SKAction *killTimer = [SKAction fadeOutWithDuration:fadeTime];    
    
    [l1 runAction:waitTillFade completion:^{
        [l1 runAction:killTimer completion:^{
            [l1 removeFromParent];
            
        }];
    }];
    [l1 runAction:leftFly];


}
@end
