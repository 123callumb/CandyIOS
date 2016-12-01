//
//  defaultLevel.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "defaultLevel.h"
#import "Character.h"

@implementation defaultLevel
+(void)setLevel:(SKScene*)s{
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"smallerRoom"];
    SKSpriteNode *desk = [SKSpriteNode spriteNodeWithImageNamed:@"desk"];
    back.zPosition = -3;
    back.xScale = 1.5;
    back.yScale = 1.5;
    back.anchorPoint = CGPointMake(0.5, 0.4);
    
    desk.zPosition = -1;
    desk.xScale = 1.5;
    desk.yScale = 1.5;
    desk.anchorPoint = CGPointMake(0.5, 0.4);
    
    [s addChild:back];
    [Character Spawn:s Position:CGPointMake(0, -30)];
    [s addChild:desk];
    
}
@end
