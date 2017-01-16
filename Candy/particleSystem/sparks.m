//
//  sparks.m
//  Candy
//
//  Created by Callum Beckwith on 14/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "sparks.h"

@implementation sparks
+(void)createSparks: (CGPoint)pos scene:(SKScene*)s{

}
+(void)createSpriteSplosion: (SKScene*)s nodeAmount:(int)nAmount pos:(CGPoint)p{
    for(int i = 1; i <= nAmount; i++){
        SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:@"spark"];
        node.xScale = 0.4;
        node.yScale = 0.4;
        node.position = p;
        
        SKAction *fade = [SKAction fadeInWithDuration:0.2];
        SKAction *fadeIn = [SKAction fadeInWithDuration:0.1];
        
        int lowerBoundX = -300;
        int upperBoundX = 300;
        int rndValueX = lowerBoundX + arc4random() % (upperBoundX - lowerBoundX);
        
        int lowerBoundY = -300;
        int upperBoundY = 300;
        int rndValueY = lowerBoundY + arc4random() % (upperBoundY - lowerBoundY);
        
        [s addChild:node];
        SKAction *leftFly = [SKAction moveBy:CGVectorMake(rndValueX,rndValueY) duration:0.3];
        SKAction *shrink = [SKAction scaleBy:0.5 duration:0.3];
        
        [node runAction:leftFly];
        [node runAction:fadeIn completion:^{
            [node runAction:fade completion:^{
                [node removeFromParent];
            }];
        }];
        [node runAction:shrink];
    }
}
@end
