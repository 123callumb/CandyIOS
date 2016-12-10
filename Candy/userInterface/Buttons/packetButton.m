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

@implementation packetButton
+(void)addButton: (SKScene*)s {

    SKSpriteNode *buttonDunno = [SKSpriteNode spriteNodeWithImageNamed:@"packetButton"];
    buttonDunno.name = @"buttonPacket";
    buttonDunno.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDunno.position = CGPointMake(s.frame.size.width/2.5, s.frame.size.height/2.3);
    buttonDunno.xScale = 0.45;
    buttonDunno.yScale = 0.42;
    buttonDunno.zPosition = 11;
    [s addChild:buttonDunno];

}
+(void)onTouch: (SKSpriteNode*)obj scene:(SKScene*)s {
    [buttonAnimation changeState:obj changeName:@"packetButtonPressured" originalName:@"packetButton"];
    [packetMenu menuHandler:s inScene:true];
    [menuHandler setCurrentMenu:3];
    [menuHandler menuRemover:s];
    SKAction *slideAway = [SKAction moveToY:obj.position.y + obj.size.height*2 duration:0.1];
    [obj runAction:slideAway];
}
+(void)reCreate: (SKScene*)s {
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"buttonPacket"];
    SKAction *slideDown = [SKAction moveToY:button.position.y - button.size.height*2 duration:0.1];
    [button runAction:slideDown];
}
@end
