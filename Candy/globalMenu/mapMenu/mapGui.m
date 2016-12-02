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
#import "mainTransition.h"

@implementation mapGui
+(void)addGui: (SKScene*)s {
    SKSpriteNode *mapBackB = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    mapBackB.name = @"mapBackButton";
    mapBackB.position = CGPointMake(0, -s.frame.size.height/2.3);
    mapBackB.zPosition = 10;
    mapBackB.xScale = 0.43;
    mapBackB.yScale = 0.43;
    [s addChild:mapBackB];
}
+(void)onTouchOfBack: (SKScene*)s obj:(SKSpriteNode*)n scene2:(SKScene*)s2 {
    if([n.name isEqualToString:@"mapBackButton"]){
        [buttonAnimation changeState:n changeName:@"backButtonPressure" originalName:@"backButton"];
        SKAction *waitForButtonPls = [SKAction waitForDuration:0.01];
        [s runAction:waitForButtonPls completion:^{
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition doorsCloseVerticalWithDuration:1]];
        }];
    }
}
@end
