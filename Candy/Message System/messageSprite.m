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
+(void)createMesssage: (SKScene*)s iconImageName:(NSString*)image line1:(NSString*)l1 line2:(NSString*)l2 line3:(NSString*)l3 line4:(NSString*)l4{
    
    SKSpriteNode *box = [SKSpriteNode spriteNodeWithImageNamed:@"messageBoxBig"];
    box.xScale = 0.1;
    box.yScale = 0.1;
    box.name = @"messageBox";
    box.zPosition = 20;
    [s addChild:box];
    
    if(image.length != 0){
        SKSpriteNode *spriteIcon = [SKSpriteNode spriteNodeWithImageNamed:image];
        spriteIcon.position = CGPointMake(0, box.frame.size.height/2);
        spriteIcon.xScale = 0.7;
        spriteIcon.yScale = 0.7;
        [box addChild:spriteIcon];
    }
    
    SKAction *growIn = [SKAction scaleTo:0.7 duration:0.2];
    
    NSLog(@"box should be here");
    [box runAction:growIn];
    
    [self addLine:box line:l1 lineNo:1];
    [self addLine:box line:l2 lineNo:2];
    [self addLine:box line:l3 lineNo:3];
    [self addLine:box line:l4 lineNo:4];
    
    messageVisabe = true;
    
}
+(bool)isMessageVisable {
    return messageVisabe;
}
+(void)addLine: (SKSpriteNode*)s line:(NSString*)l lineNo:(int)ln {
    SKLabelNode *nodel1 = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    nodel1.fontSize = 75;
    nodel1.fontColor = [SKColor blackColor];
    nodel1.text = l;
    nodel1.position = CGPointMake(0, [self calculateLine:ln fontHeight:nodel1.frame.size.height]);
    [s addChild:nodel1];
    if(l.length > 22){
        NSLog(@"WARNING: TEXT IS TOO LONG -> MAX 22 CHARACTERS");
    }
}
+(float)calculateLine: (int)lineNo fontHeight:(float)fH {
        return lineNo * -fH*1.8;
}
+(void)removeAllMessageBoxes: (SKScene*)s {
    SKSpriteNode *messageBox = (SKSpriteNode*)[s childNodeWithName:@"messageBox"];
    SKAction *scaleDown = [SKAction scaleTo:0.0 duration:0.2];
    messageVisabe = false;
    [messageBox runAction:scaleDown completion:^{
        [messageBox removeFromParent];
    }];
    
}
@end
