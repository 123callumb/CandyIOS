//
//  mapBuilding.m
//  Candy
//
//  Created by Callum Beckwith on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mapBuilding.h"
#import "buildingGui.h"

@implementation mapBuilding
+(void)addBuilding1: (SKSpriteNode*)s{
    SKSpriteNode *factory1 = [SKSpriteNode spriteNodeWithImageNamed:@"factoryMain"];
    factory1.xScale = 0.18;
    factory1.yScale = 0.158;
    factory1.position = CGPointMake(-60, -40);
    [s addChild:factory1];
    
    SKSpriteNode *starterHouse = [SKSpriteNode spriteNodeWithImageNamed:@"starterHouse"];
    starterHouse.xScale = 0.18;
    starterHouse.yScale = 0.18;
    starterHouse.position = CGPointMake(160, 10);
    starterHouse.name = @"building_starterHouse";
    [s addChild:starterHouse];
}
+(void)addBuildingTouches: (SKScene*)s node:(SKSpriteNode*)n {
    [buildingGui createOnTouch:n buildingName:@"building_starterHouse"];
}
@end
