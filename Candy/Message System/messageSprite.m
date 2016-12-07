//
//  messageSprite.m
//  Candy
//
//  Created by Callum Beckwith on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "messageSprite.h"

@implementation messageSprite
bool messageVisabe = false;
+(void)createMesssage: (SKScene*)s line1:(NSString*)l1 line2:(NSString*)l2 line3:(NSString*)l3 line4:(NSString*)l4{
    
    SKSpriteNode *box = [SKSpriteNode spriteNodeWithImageNamed:@"messageBoxBig"];
    box.xScale = 0.1;
    box.yScale = 0.1;
    box.name = @"messageBox";
    box.zPosition = 20;
    [s addChild:box];
    
    SKAction *growIn = [SKAction scaleTo:0.7 duration:0.2];
    
    NSLog(@"box should be here");
    [box runAction:growIn];
    



    
    messageVisabe = true;
    
}
+(bool)isMessageVisable {
    return messageVisabe;
}
+(void)addLine: (SKSpriteNode*)s line:(NSString*)l {
    SKLabelNode *nodel1 = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    nodel1.fontSize = 100;
    nodel1.fontColor = [SKColor blackColor];
    nodel1.text = l;
    [s addChild:nodel1];
}
@end
