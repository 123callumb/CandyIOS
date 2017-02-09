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
        
        int lowerBoundColor = 0;
        int upperBoundColor = 4;
        int rndColor = lowerBoundColor + arc4random() % (upperBoundColor - lowerBoundColor);
        
        NSArray *sparkTextures = [NSArray arrayWithObjects:@"sparkBlue", @"sparkGreen", @"sparkRed", @"spark", @"sparkPink", nil];
        
        SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:[sparkTextures objectAtIndex:rndColor]];
        node.xScale = 0.4;
        node.yScale = 0.4;
        node.position = p;
        node.zPosition = 6;
        
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
