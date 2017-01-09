//
//  packetButton.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetButton.h"
#import "buttonAnimation.h"
#import "packetMenu.h"
#import "menuHandler.h"
#import "menuButton.h"
#import "tutorialMessages.h"

@implementation packetButton
+(void)onTouch: (SKSpriteNode*)obj scene:(SKScene*)s {
    [buttonAnimation changeState:obj changeName:@"packetsButtonTop" originalName:@"packetsButtonTop"];
    [tutorialMessages firstTimePacktsButton:s.view];
    [packetMenu menuHandler:s inScene:true];
    [menuHandler setCurrentMenu:3];
    [menuHandler menuRemover:s];
    [menuButton slideAwayMenu:s];
    SKAction *slideAway = [SKAction moveToY:obj.position.y + obj.size.height*2 duration:0.1];
    [obj runAction:slideAway];
}
+(void)reCreate: (SKScene*)s {
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"buttonPacket"];
    SKAction *slideDown = [SKAction moveToY:button.position.y - button.size.height*2 duration:0.1];
    [button runAction:slideDown];

}
+(void)slideAway: (SKScene*)s  {
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"buttonPacket"];

    SKAction *slideAway = [SKAction moveToY:button.position.y + button.size.height*2 duration:0.1];
    [button runAction:slideAway];
}
@end
