//
//  packetDisplayItem.m
//  Candy
//
//  Created by Callum Beckwith on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "packetDisplayItem.h"
#import "packetInventoryData.h"
#import "lollyPacket.h"
#import "bonbonPacket.h"
#import "wrappedPacket.h"
#import "chewPacket.h"
#import "jawbreakerPacket.h"
#import "candybarPacket.h"
#import "marshmallowPacket.h"
#import "pencilPacket.h"
#import "eggPacket.h"

@implementation packetDisplayItem
+(void)addOwnedPackets: (SKScene*)s {
    for (int i = 0; i <= [packetInventoryData getSlotsFull] - 1; i++) {
        [self createPacketViews:s number:i];
    }
    if([packetInventoryData getSlotsFull] == 0){
        [self createBuyButton:s];
    }
}
+(void)createPacketViews: (SKScene*)s number:(int)noID {
    SKSpriteNode *backPane = [SKSpriteNode spriteNodeWithImageNamed:@"packetContent"];
    NSString *packetAtID = [packetInventoryData getPacketAtSlot:noID];
    SKSpriteNode *openButton = [SKSpriteNode spriteNodeWithImageNamed:@"openGreenButton"];
    SKSpriteNode *packet = [SKSpriteNode spriteNodeWithImageNamed:packetAtID];
    
    openButton.position = CGPointMake(0, -backPane.size.height/2 + openButton.size.height/1.6);
    openButton.name = [NSString stringWithFormat:@"openPacketButton_ID_%d", noID];
    openButton.xScale = 0.8;
    openButton.yScale = 0.8;
    
    backPane.xScale = 0.47;
    backPane.yScale = 0.47;
    
    packet.position = CGPointMake(0, backPane.size.height + packet.size.height/3.2);
    
    
    if([packetAtID isEqualToString:@"lollyPacket"]){
        [lollyPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"bonbonPacket"]){
        [bonbonPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"sweetPacket"]){
        [wrappedPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"chewPacket"]){
        [chewPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"jawbreakerPacket"]){
        [jawbreakerPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"candybarPacket"]){
        [candybarPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"marshmallowPacket"]){
        [marshmallowPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"pencilPacket"]){
        [pencilPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    if([packetAtID isEqualToString:@"eggPacket"]){
        [eggPacket addContentSection:backPane];
        [backPane addChild:packet];
    }
    
    
    backPane.position = CGPointMake((s.frame.size.width * noID), -s.frame.size.height/8);
    [backPane addChild:openButton];
    
    backPane.name = [NSString stringWithFormat:@"packetPane_%d", noID];
    
    [s addChild:backPane];
    
}
+(void)createBuyButton: (SKScene*)s {
    SKLabelNode *sorry = [SKLabelNode labelNodeWithText:@"You don't own any sweet packets :("];
    sorry.fontName = @"Coder's-Crux";
    sorry.fontSize = 50;
    sorry.fontColor = [SKColor blackColor];
    [s addChild:sorry];
}
@end
