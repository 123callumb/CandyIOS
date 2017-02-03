//
//  menuButton.m
//  Candy
//
//  Created by Callum Beckwith on 03/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "menuButton.h"
#import "bottomBar.h"
#import "packetButton.h"
#import "tutorialMessages.h"
#import "trendsButton.h"
#import "buttonAnimation.h"
#import "menuUI.h"


@implementation menuButton
+(void)onTouch: (SKSpriteNode*)obj scene:(SKScene*)s view:(UIView*)v{
    [tutorialMessages firstTimeMenuButton:s.view];
    [buttonAnimation changeState:obj changeName:@"menuTopState1" originalName:@"menuTopState0"];
    [menuUi createMenu:v];
}
+(void)reCreate: (SKScene*)s {
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"buttonMenu"];
    SKAction *slideDown = [SKAction moveToY:button.position.y - button.size.height*2 duration:0.1];
    [button runAction:slideDown];
    
}
+(void)createCloseButton: (SKScene*)s {
    SKSpriteNode *closeButon = [SKSpriteNode spriteNodeWithImageNamed:@"closeButton"];
    closeButon.yScale = 0.6;
    closeButon.xScale = 0.6;
    closeButon.name = @"closeButton";
    closeButon.zPosition = 14;
    closeButon.position = CGPointMake(-s.frame.size.width/2 + closeButon.frame.size.width/2, s.frame.size.height/2.2 + closeButon.size.height*2);
    [s addChild:closeButon];
    
}
+(void)addCloseButton: (SKScene*)s {
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"closeButton"];
    
    SKAction *slideDown = [SKAction moveToY:button.position.y - button.size.height*2 duration:0.1];
    [button runAction:slideDown];
}
+(void)onCloseButton: (SKSpriteNode*)obj scene:(SKScene*)s {
    SKAction *slideAway = [SKAction moveToY:obj.position.y + obj.size.height*2 duration:0.1];
    [bottomBar removeBar:s];
    [self reCreate:s];
    [obj runAction:slideAway];
}
+(void)slideAwayMenu: (SKScene*)s  {
    
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"buttonMenu"];
    
    SKAction *slideAway = [SKAction moveToY:button.position.y + button.size.height*2 duration:0.1];
    [button runAction:slideAway];
}
@end
