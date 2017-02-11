//
//  gemGemeratorGui.m
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemGemeratorGui.h"
#import "buttonAnimation.h"
#import "gemInteractionUI.h"
#import "menuHandler.h"

@implementation gemGemeratorGui
+(void)createGemMenu: (SKScene*)s {
    SKSpriteNode *gemBacking = [SKSpriteNode spriteNodeWithImageNamed:@"gemPage"];
    SKSpriteNode *done = [self gemDoneButton:s];
    gemBacking.xScale = 0.43;
    gemBacking.yScale = 0.43;
    gemBacking.position = CGPointMake(s.frame.size.width, 0);
    gemBacking.name = @"gemMenu";
    gemBacking.anchorPoint = CGPointMake(0.5, 0.55);
    
    SKAction *slideRight = [SKAction moveByX:-s.frame.size.width y:0 duration:0.15];
    
    [gemInteractionUI addInteractionUI:gemBacking];
    
    [s addChild:done];
    [s addChild:gemBacking];
    
    
    [gemBacking runAction:slideRight];
    [done runAction:slideRight];
}
+(SKSpriteNode*)gemDoneButton: (SKScene*)s {
    SKSpriteNode *buttonDone = [SKSpriteNode spriteNodeWithImageNamed:@"doneButton"];
    buttonDone.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDone.position = CGPointMake(0 + s.frame.size.width, -s.frame.size.height/2.25);
    buttonDone.xScale = 0.45;
    buttonDone.yScale = 0.45;
    buttonDone.zPosition = 11;
    buttonDone.name = @"gemDoneButton";
    return buttonDone;
}
+(void)onDoneTouch: (SKSpriteNode*)s scene:(SKScene*)sk{
    if([s.name isEqualToString:@"gemDoneButton"]){
        [self removeStatsMenu:sk];
        [menuHandler setCurrentMenu:4];
        [buttonAnimation changeState:(SKSpriteNode*)s changeName:@"donePressured" originalName:@"doneButton"];
    }
}
+(void)removeStatsMenu: (SKScene*)s {
    SKSpriteNode *menu = (SKSpriteNode*)[s childNodeWithName:@"gemMenu"];
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"gemDoneButton"];
    
    SKAction *slideRight = [SKAction moveByX:s.frame.size.width y:0 duration:0.15];
    
    [menu runAction:slideRight completion:^{
        [menu removeFromParent];
    }];
    [button runAction:slideRight completion:^{
        [button removeFromParent];
    }];
}
@end
