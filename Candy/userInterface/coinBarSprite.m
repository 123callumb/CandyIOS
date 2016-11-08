//
//  coinBarSprite.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "money.h"
#import "coinBarSprite.h"

@implementation coinBarSprite
+(void)addCoinBar:(SKScene *)s {
    SKSpriteNode *coinBar = [SKSpriteNode spriteNodeWithImageNamed:@"coinBar"];
    coinBar.anchorPoint = CGPointMake(0.5, 0.5);
    coinBar.position = CGPointMake(-s.frame.size.width/4.4, s.frame.size.height/2.3);
    coinBar.xScale = 0.45;
    coinBar.yScale = 0.42;
    coinBar.zPosition = 11;
    coinBar.name = @"UIcoinBar";
    [self addText:coinBar];
    [s addChild:coinBar];
}
+(void)addText: (SKSpriteNode *)n; {
    SKLabelNode *moneyText = [SKLabelNode labelNodeWithFontNamed:@""];
    moneyText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    moneyText.name = @"moneyText";
    moneyText.zPosition = 12;
    moneyText.fontSize = 100;
    moneyText.text = [money getBalanceAsString];
    moneyText.position = CGPointMake(0-n.frame.size.width/2 , 0-moneyText.frame.size.height/3.3);
    [n addChild:moneyText];
}
+(void)updateText: (SKScene *)s {
    SKSpriteNode *bar = (SKSpriteNode *)[s childNodeWithName:@"UIcoinBar"];
    SKLabelNode *mText = (SKLabelNode *)[bar childNodeWithName:@"moneyText"];
    mText.text = [money getBalanceAsString];
}
@end
