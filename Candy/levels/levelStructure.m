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
    [self addDesk:s];
    [levelWorkstations addWorkstations:s];
}
+(void)addDesk: (SKScene*)s {
    
    int building = [buildingType getCurrentBuildingID];
    
    if(building < 4){
        [desks addDesk:CGPointMake(0, s.frame.size.height/8) scale:0.85 nodeToAttatch:s];
    }
    if (building >=4 && building <= 5) {
        [desks addDesk:CGPointMake(0, s.frame.size.height/7) scale:0.75 nodeToAttatch:s];
    }
    if (building >=6 && building <= 7) {
        [desks addDesk:CGPointMake(0, s.frame.size.height/6) scale:0.65 nodeToAttatch:s];
    }
    if (building >=8 && building <= 9) {
        [desks addDesk:CGPointMake(0, s.frame.size.height/5.35) scale:0.55 nodeToAttatch:s];
    }
}
+(void)addFloor: (SKScene*)s {
    SKSpriteNode *floor = [SKSpriteNode spriteNodeWithImageNamed:[floors getCurrentFloor]];
    floor.size = CGSizeMake(s.frame.size.width, s.frame.size.height/1.4);
    floor.position = CGPointMake(0, -s.frame.size.height/7);
    floor.zPosition = -4;
    floor.anchorPoint = CGPointMake(0.5, 0.5);
    floor.name = @"levelFloor";
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
    
    int building = [buildingType getCurrentBuildingID];
    
    if(building < 4){
        return 0.75;
    }
    if (building >= 4 && building <= 5) {
        return 0.65;
    }
    if (building >= 6 && building <= 7) {
        return 0.55;
    }
    if (building >= 8 && building <= 9) {
        return 0.45;
    }
    return 0.75;
}
+(CGPoint)returnCharacterPosition: (SKScene*)s {
    int building = [buildingType getCurrentBuildingID];
    CGPoint pos = CGPointMake(0, s.frame.size.height/7.4);
    
    if(building < 4){
        pos = CGPointMake(0, s.frame.size.height/7.4);
    }
    if (building >= 4 && building <= 5) {
        pos = CGPointMake(0, s.frame.size.height/6.8);
    }
    if (building >= 6 && building <= 7) {
        pos = CGPointMake(0, s.frame.size.height/5.8);
    }
    if (building >= 8 && building <= 9) {
        pos = CGPointMake(0, s.frame.size.height/5.2);
    }
    return pos;
}
@end
