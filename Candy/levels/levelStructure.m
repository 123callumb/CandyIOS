//
//  levelStructure.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "levelStructure.h"
#import "floors.h"
#import "buildingType.h"
#import "Character.h"
#import "levelWorkstations.h"
#import "desks.h"
#import "dynamicBackgrounds.h"
#import "spinWheel.h"

@implementation levelStructure
+(void)createLevel: (SKScene*)s {
    [self addDynamicBackground:s];
    [self addFloor:s];
    [self addBuildingType:s];
    [self addMainCharacter:s];
    [desks addDesk:CGPointMake(0, s.frame.size.height/8) scale:0.85 nodeToAttatch:s];
    [levelWorkstations addWorkstations:s];
}
+(void)addFloorItems: (SKSpriteNode*)s {
}
+(void)addFloor: (SKScene*)s {
    SKSpriteNode *floor = [SKSpriteNode spriteNodeWithImageNamed:[floors getCurrentFloor]];
    floor.size = CGSizeMake(s.frame.size.width, s.frame.size.height/1.4);
    floor.position = CGPointMake(0, -s.frame.size.height/7);
    floor.zPosition = -4;
    floor.anchorPoint = CGPointMake(0.5, 0.5);
    floor.name = @"levelFloor";
    [self addFloorItems:floor];
    [s addChild:floor];
}
+(void)addBuildingType: (SKScene*)s {
    SKSpriteNode *wall = [SKSpriteNode spriteNodeWithImageNamed:[buildingType getCurrentBuildingWall]];
    wall.size = CGSizeMake(s.frame.size.width, s.frame.size.height/3.5);
    wall.position = CGPointMake(0, s.frame.size.height/2-wall.frame.size.height/2);
    wall.zPosition = -4;
    [s addChild:wall];
}
+(void)addMainCharacter: (SKScene*)s {
    [Character Spawn:s Position:[self returnCharacterPosition:s] Scale:[self returnCharacterScale]];
}
+(void)addDynamicBackground: (SKScene*)s {
    [dynamicBackgrounds addDynamicBackground:s];
}

//These need to go in a character class V probably best when we have character animations on the go etc!
+(float)returnCharacterScale {
    if([buildingType getCurrentBuildingID] == 0){
        return 0.75;
    }
    return 0.75;
}
+(CGPoint)returnCharacterPosition: (SKScene*)s {
    CGPoint pos = CGPointMake(0, s.frame.size.height/7.4);
        if([buildingType getCurrentBuildingID] == 0){
            pos = CGPointMake(0, s.frame.size.height/7.4);
        }
    return pos;
}
@end
