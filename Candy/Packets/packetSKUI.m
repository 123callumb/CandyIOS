//
//  packetSKUI.m
//  Candy
//
//  Created by Callum Beckwith on 11/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetSKUI.h"
#import "mainUI.h"
#import "mainTransition.h"
#import "buttonAnimation.h"

@implementation packetSKUI
+(void)addPacketUI: (SKScene*)s {
    [mainUI nonInteractiveUI:s];
    [self backButtonUI:s];
}
+(void)backButtonUI: (SKScene*)s {
    SKSpriteNode *backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    backButton.xScale = 0.43;
    backButton.yScale = 0.43;
    backButton.position = CGPointMake(0,  -s.frame.size.height/2.25);
    backButton.zPosition = 12;
    backButton.name = @"backButtonPackets";
    
    [s addChild:backButton];
}
+(void)onBackTouch: (SKScene*)s obj:(SKNode*)n {
    if([n.name isEqualToString:@"backButtonPackets"]){
        [buttonAnimation changeState:n changeName:@"backButtonPressure" originalName:@"backButton"];
        SKAction *wait = [SKAction waitForDuration:0.1];
        [n runAction:wait completion:^{
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition doorsOpenVerticalWithDuration:0.3]];
        }];
    }
}
@end
