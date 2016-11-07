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
@end
