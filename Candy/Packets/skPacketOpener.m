//
//  skPacketOpener.m
//  Candy
//
//  Created by Callum Beckwith on 13/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "skPacketOpener.h"
#import "packetUIButtons.h"
#import "bonbonPacket.h"
#import "packetScrollUI.h"
#import "packetInventroySlot.h"
#import "lollyPacket.h"
#import "chewPacket.h"
#import "wrappedPacket.h"
#import "jawbreakerPacket.h"
#import "buttonAnimation.h"

//Okay i know this class really needs cleaning up but everything works so later on it can be cleaned to be more optimal.

@implementation skPacketOpener

NSString *openedItem;

+(void)addOpenerButton: (SKScene*)s{
    SKSpriteNode *openTray = [SKSpriteNode spriteNodeWithImageNamed:@"openTrayBG"];
    openTray.position = CGPointMake(0, s.frame.size.height/5);
    openTray.xScale = 0.5;
    openTray.yScale = 0.5;
    openTray.zPosition = 1;

    SKSpriteNode *openButon = [SKSpriteNode spriteNodeWithImageNamed:@"openPacketButton"];
    openButon.xScale = 0.4;
    openButon.yScale = 0.4;
    openButon.name = @"buttonPacketOpen";
    openButon.zPosition = 2;
    openButon.position = CGPointMake(0, -s.frame.size.height/8);
    [s addChild:openButon];
    
    SKSpriteNode *packetContents = [SKSpriteNode spriteNodeWithImageNamed:@"packetContentPreback"];
    packetContents.position = CGPointMake(0, -s.frame.size.height/8.5);
    packetContents.xScale = 0.46;
    packetContents.yScale = 0.45;
    
    [s addChild:packetContents];
    [s addChild:openTray];

}
+(void)onOpenPress: (SKNode*)n scene:(SKScene*)s view:(UIView*)v{
    if([n.name isEqualToString:@"buttonPacketOpen"]){
        [buttonAnimation changeState:n changeName:@"openPacketButtonPressed" originalName:@"openPacketButton"];
        
        [n runAction:[SKAction waitForDuration:0.3] completion:^{
                [self addOpener:s];
            [n setHidden:true];
        }];
        [n runAction:[SKAction waitForDuration:9] completion:^{
            [n setHidden:false];
        }];

    }
    if([n.name isEqualToString:@"congratsUi"]){
        SKSpriteNode *uiT = (SKSpriteNode*)[s childNodeWithName:@"openerUiT"];
        SKSpriteNode *uiL = (SKSpriteNode*)[s childNodeWithName:@"openerUiL"];
        SKSpriteNode *uiR = (SKSpriteNode*)[s childNodeWithName:@"openerUiR"];
        SKSpriteNode *uiC = (SKSpriteNode*)[s childNodeWithName:@"openerUiC"];

        [uiT removeFromParent];
        [uiL removeFromParent];
        [uiR removeFromParent];
        [uiC removeFromParent];
        [n removeFromParent];
        [packetScrollUI addScrollUI:v];
    }
}
+(void)addOpener: (SKScene*)s {
    
    SKSpriteNode *leftTray = [SKSpriteNode spriteNodeWithImageNamed:@"unboxLeft"];
    SKSpriteNode *rightTray = [SKSpriteNode spriteNodeWithImageNamed:@"unboxRight"];
    leftTray.position = CGPointMake(-s.frame.size.width/3, s.frame.size.height/5);
    leftTray.xScale = 0.5;
    leftTray.yScale = 0.5;
    rightTray.position = CGPointMake(s.frame.size.width/3, s.frame.size.height/5);
    rightTray.xScale = 0.5;
    rightTray.yScale = 0.5;
    leftTray.zPosition = 11;
    rightTray.zPosition = 11;
    rightTray.name = @"openerUiR";
    leftTray.name = @"openerUiL";
    
        SKSpriteNode *packetContents = [SKSpriteNode spriteNodeWithImageNamed:@"packetContentBb"];
        packetContents.position = CGPointMake(0, -s.frame.size.height/9);
        packetContents.xScale = 0.46;
        packetContents.yScale = 0.46;
        packetContents.name = @"openerUiC";
        
        SKSpriteNode *openTray = [SKSpriteNode spriteNodeWithImageNamed:@"packetOpenTray"];
        openTray.position = CGPointMake(0, s.frame.size.height/5);
        openTray.xScale = 0.5;
        openTray.yScale = 0.5;
        openTray.zPosition = 1;
        openTray.name = @"openerUiT";

    
    //if statements here for determineing the packet
    if([[packetInventroySlot getSelectedPacket] isEqualToString:@"bonbonPacket"]){
        [bonbonPacket addContentSection:packetContents];
        [bonbonPacket createRandomSlider:s yPos:s.frame.size.height/4.84];
    }
    if([[packetInventroySlot getSelectedPacket] isEqualToString:@"lollyPacket"]){
        [lollyPacket addContentSection:packetContents];
        [lollyPacket createRandomSlider:s yPos:s.frame.size.height/4.84];
    }
    if([[packetInventroySlot getSelectedPacket] isEqualToString:@"sweetPacket"]){
        [wrappedPacket addContentSection:packetContents];
        [wrappedPacket createRandomSlider:s yPos:s.frame.size.height/4.84];
    }
    if([[packetInventroySlot getSelectedPacket] isEqualToString:@"chewPacket"]){
        [chewPacket addContentSection:packetContents];
        [chewPacket createRandomSlider:s yPos:s.frame.size.height/4.84];
    }
    if([[packetInventroySlot getSelectedPacket] isEqualToString:@"jawbreakerPacket"]){
        [jawbreakerPacket addContentSection:packetContents];
        [jawbreakerPacket createRandomSlider:s yPos:s.frame.size.height/4.84];
    }
    
    [s addChild:packetContents];
    [s addChild:openTray];
    [s addChild:rightTray];
    [s addChild:leftTray];

}
+(void)setOpenedItem: (NSString*)n {
    openedItem = n;
}
+(NSString*)getOpenedString {
    return openedItem;
}
+(void)openedSweet: (SKScene*)s {
    SKAction *wait = [SKAction waitForDuration:0.75];
    [s runAction:wait completion:^{
    
    SKSpriteNode *congratsBG = [SKSpriteNode spriteNodeWithImageNamed:@"congrats"];
    congratsBG.position = CGPointMake(0, 0);
    congratsBG.xScale = 0.1;
    congratsBG.yScale = 0.1;
    congratsBG.zPosition = 12;

    SKSpriteNode *itemGot = [SKSpriteNode spriteNodeWithImageNamed:openedItem];
    itemGot.position = CGPointMake(0, s.frame.size.height/4.5);
    itemGot.xScale = 1.6;
    itemGot.yScale = 1.7;
    [congratsBG addChild:itemGot];
    
    congratsBG.name = @"congratsUi";
        
    [s addChild:congratsBG];
    SKAction *scale = [SKAction scaleTo:0.5 duration:0.4];
    [congratsBG runAction:scale];
    }];
}
@end
