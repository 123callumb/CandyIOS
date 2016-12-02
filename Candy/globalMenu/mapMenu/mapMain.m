//
//  mapMain.m
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mapMain.h"
#import "mapGui.h"

@implementation mapMain
+(void)createMap: (SKScene*)s {
    SKSpriteNode *map = [SKSpriteNode spriteNodeWithImageNamed:@"mapTemplate"];
    map.name = @"mainMap";
    map.xScale = 2;
    map.yScale = 2;
    [mapGui addGui:s];
    [s addChild:map];
}
+(void)mapNavigation: (CGPoint)p node:(SKSpriteNode*)s {
    if([s.name isEqualToString:@"mainMap"]){
        s.position = p;
    }
}
@end
