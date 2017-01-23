//
//  splashBacking.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "splashBacking.h"

@implementation splashBacking

//This is not an object and does not return anything, instead it creates the object inside the method and adds its sef to the scene given when the method is written. Can be a lot faster especailly because it only has static values.


+(void)main: (SKScene *)scene; {
    SKSpriteNode *splash = [SKSpriteNode spriteNodeWithImageNamed:@"HDSplash"];
    splash.anchorPoint = CGPointMake(0.5, 0.5);
    splash.xScale = 0.9;
    splash.yScale= 0.9;
    [scene addChild:splash];
}

@end
