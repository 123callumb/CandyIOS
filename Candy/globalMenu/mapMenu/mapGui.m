//
//  mapGui.m
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//
//  This can be seperate classes eventurally if it gets too cluttered!

#import "mapGui.h"
#import "buttonAnimation.h"

@implementation mapGui
+(void)addGui: (SKScene*)s {
    SKSpriteNode *mapBackB = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    mapBackB.name = @"mapBackButton";
    mapBackB.position = CGPointMake(0, 0);
    mapBackB.zPosition = 10;
    mapBackB.xScale = 0.43;
    mapBackB.yScale = 0.43;
    [s addChild:mapBackB];
}
+(void)onTouchOfBack: (SKScene*)s obj:(SKSpriteNode*)n scene2:(SKScene*)s2 {
    if([n.name isEqualToString:@"mapBackButton"]){
        [buttonAnimation changeState:n changeName:@"backButtonPressure" originalName:@"backButton"];
        SKTransition *thing = [SKTransition doorsOpenVerticalWithDuration:0.3];
        [s.view presentScene:s2 transition:thing];
    }
}
@end
