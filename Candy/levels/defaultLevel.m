//
//  defaultLevel.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "defaultLevel.h"
#import "Character.h"
#import "candyMachines.h"

@implementation defaultLevel
+(void)setLevel:(SKScene*)s{
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"crap_room_lower"];
    SKSpriteNode *light = [SKSpriteNode spriteNodeWithImageNamed:@"crap_room_light"];
    SKSpriteNode *box = [SKSpriteNode spriteNodeWithImageNamed:@"crap_room_box"];
    SKSpriteNode *lightEmition = [SKSpriteNode spriteNodeWithImageNamed:@"light_animation"];
    
    back.zPosition = -3;
    back.xScale = 1.56;
    back.yScale = 1.56;
    back.anchorPoint = CGPointMake(0.5, 0);
    back.position = CGPointMake(0, -460);
    
    box.zPosition = -1;
    box.xScale = 1.56;
    box.yScale = 1.56;
    box.anchorPoint = CGPointMake(0.5, 0);
    box.position = CGPointMake(0, -460);
    
    light.zPosition = -1;
    light.xScale = 1.56;
    light.yScale = 1.56;
    light.anchorPoint = CGPointMake(0.5, 0);
    light.position = CGPointMake(0, -460);
    
    lightEmition.zPosition = -1;
    lightEmition.xScale = 1.56;
    lightEmition.yScale = 1.56;
    lightEmition.position = CGPointMake(3, 410);
    
    [s addChild:back];
    [s addChild:lightEmition];
    [s addChild:light];
    [Character Spawn:s Position:CGPointMake(200, -207) Scale:1];
    [candyMachines baseMachine:s];
    [s addChild:box];
    //[s addChild:desk];
    
}
@end
