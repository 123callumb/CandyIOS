//
//  menuBackButton.m
//  Candy
//
//  Created by Callum Beckwith on 13/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "menuBackButton.h"
#import "buttonAnimation.h"
#import "menuHandler.h"
#import "quickSelectUI.h"

@implementation menuBackButton
+(void)createButton:(SKScene*)s {
    SKSpriteNode *buttonBack = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    buttonBack.anchorPoint = CGPointMake(0.5, 0.5);
    buttonBack.position = CGPointMake(0 + s.frame.size.width, -s.frame.size.height/2.25);
    buttonBack.xScale = 0.45;
    buttonBack.yScale = 0.45;
    buttonBack.zPosition = 11;
    buttonBack.name = @"buttonBack";
    [s addChild:buttonBack];
    
    SKAction *hiThere = [SKAction moveByX:-s.frame.size.width y:0 duration:0.15];
    [buttonBack runAction:hiThere];
}
+(void)removeButton:(SKScene*)s {
    SKSpriteNode *backButton = (SKSpriteNode*)[s childNodeWithName:@"buttonBack"];
    
    SKAction *byeThere = [SKAction moveByX:-s.frame.size.width y:0 duration:0.15];

    
    [backButton runAction:byeThere completion:^{
        [backButton removeFromParent];
    }];
   }
+(void)onTouch: (SKNode*)n currentScene:(SKScene*)s view:(UIView*)v{
    [buttonAnimation changeState:n changeName:@"backButtonPressure" originalName:@"backButton"];
    SKAction *waitFam = [SKAction waitForDuration:0.15];
    [n runAction:waitFam completion:^{
        [self removeButton:s];
        [menuHandler closeMenu:s view:v];
        [quickSelectUI removeUI:v];
    }];
}
@end
