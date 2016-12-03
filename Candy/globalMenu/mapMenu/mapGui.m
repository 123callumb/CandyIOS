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
#import "coinBarSprite.h"

@implementation mapGui

bool navigationHeld = false;

+(void)addGui: (SKScene*)s {
    SKSpriteNode *mapBackB = [SKSpriteNode spriteNodeWithImageNamed:@"backButtonSmall"];
    mapBackB.name = @"mapBackButton";
    mapBackB.position = CGPointMake(0, -s.frame.size.height/2.3);
    mapBackB.zPosition = 10;
    mapBackB.xScale = 0.43;
    mapBackB.yScale = 0.43;
    [self navigationButtons:s];
    [coinBarSprite addCoinBar:s];
    [s addChild:mapBackB];
}
+(void)onTouchOfBack: (SKScene*)s obj:(SKSpriteNode*)n scene2:(SKScene*)s2 {
    if([n.name isEqualToString:@"mapBackButton"]){
        [buttonAnimation changeState:n changeName:@"backButtonSmallPressed" originalName:@"backButtonSmall"];
        SKAction *waitForButtonPls = [SKAction waitForDuration:0.01];
        [s runAction:waitForButtonPls completion:^{
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition doorsCloseVerticalWithDuration:1]];
        }];
    }
}
+(void)navigationButtons: (SKScene*)s {
    SKSpriteNode *leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"buttonLeft"];
    SKSpriteNode *rightButton = [SKSpriteNode spriteNodeWithImageNamed:@"buttonRight"];
    
    leftButton.yScale = 0.43;
    leftButton.xScale = 0.43;
    rightButton.yScale = 0.43;
    rightButton.xScale = 0.43;
    
    leftButton.name = @"mapLeftButton";
    rightButton.name = @"mapRightButton";
    
    leftButton.position = CGPointMake(-s.frame.size.width/3, -s.frame.size.height/2.3);
    rightButton.position = CGPointMake(s.frame.size.width/3, -s.frame.size.height/2.3);
    
    rightButton.zPosition = 10;
    leftButton.zPosition = 10;
    
    [s addChild:leftButton];
    [s addChild:rightButton];
}
+(void)onNavigationPress: (SKSpriteNode*)obj scene:(SKScene*)s {
    
    SKSpriteNode *map = (SKSpriteNode*)[s childNodeWithName:@"mainMap"];
    
    if([obj.name isEqualToString:@"mapLeftButton"]){
        navigationHeld = true;
        obj.texture = [SKTexture textureWithImageNamed:@"leftButtonPressed"];
        [self moveMapLoopLeft:map];
    }
    if([obj.name isEqualToString:@"mapRightButton"]){
        navigationHeld = true;
        obj.texture = [SKTexture textureWithImageNamed:@"rightButtonPressed"];
        [self moveMapLoopRight:map];
    }
}
+(void)nagivationEnded: (SKScene*)s {
    if(navigationHeld){
        NSLog(@"nav ended");
        navigationHeld = false;
        SKSpriteNode *nrb = (SKSpriteNode*)[s childNodeWithName:@"mapRightButton"];
        SKSpriteNode *nlb = (SKSpriteNode*)[s childNodeWithName:@"mapLeftButton"];
        nrb.texture = [SKTexture textureWithImageNamed:@"buttonRight"];
        nlb.texture = [SKTexture textureWithImageNamed:@"buttonLeft"];
    }
}
+(void)moveMapLoopLeft:(SKSpriteNode*)n {
    if(navigationHeld){
        if(n.position.x < 360){
        SKAction *moveMapLeft = [SKAction moveByX:20 y:0 duration:0.05];
        [n runAction:moveMapLeft completion:^{
            [self moveMapLoopLeft:n];
                    
            }];
        }
    }
}
+(void)moveMapLoopRight:(SKSpriteNode*)n {
    if(navigationHeld){
        if(n.position.x > -360){
        SKAction *moveMapRight = [SKAction moveByX:-20 y:0 duration:0.05];
        [n runAction:moveMapRight completion:^{
            [self moveMapLoopRight:n];

        }];
        }
    }
}
@end
