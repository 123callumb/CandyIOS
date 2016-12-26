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
#import "skPacketOpener.h"

@implementation packetSKUI
+(void)addPacketUI: (SKScene*)s {
    s.backgroundColor = [UIColor lightGrayColor];
    [mainUI nonInteractiveUI:s];
    [self backButtonUI:s];
    [self header:s];
    [skPacketOpener addOpenerButton:s];
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
+(void)onBackTouch: (SKScene*)s obj:(SKNode*)n view:(UIView*)v{
    if([n.name isEqualToString:@"backButtonPackets"]){
        [buttonAnimation changeState:n changeName:@"backButtonPressure" originalName:@"backButton"];
        SKAction *wait = [SKAction waitForDuration:0.1];
        [n runAction:wait completion:^{
            UIScrollView *scrollThing = (UIScrollView*)[v viewWithTag:2000];
            [scrollThing removeFromSuperview];
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition doorsOpenVerticalWithDuration:0.3]];
        }];
    }
}
+(void)header: (SKScene*)s {
    SKSpriteNode *headerImage = [SKSpriteNode spriteNodeWithImageNamed:@"myPacketsHeader"];
    headerImage.xScale = 0.52;
    headerImage.yScale = 0.483;
    headerImage.position = CGPointMake(0,(s.frame.size.height/2) - headerImage.frame.size.height/2);
    
    [s addChild:headerImage];
}
@end
