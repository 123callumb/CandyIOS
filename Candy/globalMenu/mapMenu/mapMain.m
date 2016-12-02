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
    [mapGui addGui:s];
    [mapBuilding addBuilding1:map];
    [s addChild:map];
}
+(void)mapNavigation: (CGPoint)p node:(SKSpriteNode*)s {
    if([s.name isEqualToString:@"mainMap"]){
        [self calculate:s point:p];

    }
}
+(void)calculate: (SKSpriteNode*)s point:(CGPoint)p {
    if([s containsPoint:p]){
        SKAction *moveBy = [SKAction moveTo:CGPointMake(p.x, 0) duration:0.02];
        [s runAction:moveBy];
        movedBy = p.x;
        
    }
}
+(void)onRelease: (SKSpriteNode*)s point:(CGPoint)p {
    if([s.name isEqualToString:@"mainMap"]){
        s.anchorPoint = CGPointMake(s.anchorPoint.x - movedBy/1000, 0.5);
    }
}
@end
