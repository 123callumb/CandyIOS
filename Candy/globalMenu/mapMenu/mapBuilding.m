//
//  mapBuilding.m
//  Candy
//
//  Created by Callum Beckwith on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mapBuilding.h"

@implementation mapBuilding
+(void)addBuilding1: (SKSpriteNode*)s{
    SKSpriteNode *factory1 = [SKSpriteNode spriteNodeWithImageNamed:@"factoryMain"];
    factory1.xScale = 0.2;
    factory1.yScale = 0.2;
    [s addChild:factory1];

}
@end
