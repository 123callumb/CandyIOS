//
//  mapMain.m
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mapMain.h"
#import "mapGui.h"
#import "mapBuilding.h"

@implementation mapMain

int movedBy = 0;

+(void)createMap: (SKScene*)s {
    SKSpriteNode *map = [SKSpriteNode spriteNodeWithImageNamed:@"mapTemplate"];
    map.name = @"mainMap";
    map.xScale = 1.5;
    map.yScale = 1.5;
    map.anchorPoint = CGPointMake(0.5, 0.5);
    map.position = CGPointMake(-100, 0);
    [mapGui addGui:s];
    [mapBuilding addBuilding1:map];
    [s addChild:map];
}
@end
