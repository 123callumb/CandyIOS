//
//  defaultLevel.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "defaultLevel.h"

@implementation defaultLevel
+(void)setLevel:(SKScene*)s{
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"smallerRoom"];
    back.zPosition = -1;
    back.xScale = 1.5;
    back.yScale = 1.5;
    back.anchorPoint = CGPointMake(0.5, 0.4);
    [s addChild:back];
}
@end
