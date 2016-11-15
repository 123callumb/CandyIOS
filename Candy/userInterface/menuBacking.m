//
//  menuBacking.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "menuBacking.h"

@implementation menuBacking
+(id)createBacking; {
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"menuBackLong"];
    back.xScale = 0.43;
    back.yScale = 0.43;
    back.anchorPoint = CGPointMake(0.5, 0.55);
    return back;
}
+(id)createStatsBacking {
    SKSpriteNode *sBack = [SKSpriteNode spriteNodeWithImageNamed:@"menuStatsLong"];
    sBack.xScale = 0.43;
    sBack.yScale = 0.43;
    sBack.anchorPoint = CGPointMake(0.5, 0.55);
    return sBack;
}
@end
