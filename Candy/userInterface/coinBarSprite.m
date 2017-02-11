//
//  coinBarSprite.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "money.h"
#import "coinBarSprite.h"
#import "menuHandler.h"
#import "gems.h"

@implementation coinBarSprite
+(void)addCoinBar:(SKScene *)s {
    SKSpriteNode *coinBar = [SKSpriteNode spriteNodeWithImageNamed:@"topCoinBar"];
    coinBar.anchorPoint = CGPointMake(0.5, 0.5);
    coinBar.position = CGPointMake(0, s.frame.size.height/2.2);
    coinBar.xScale = 0.4;
    coinBar.yScale = 0.4;
    coinBar.zPosition = 11;
    coinBar.name = @"UIcoinBar";
    [self addText:coinBar];
    [s addChild:coinBar];
    [self addGemBar:s];
}
+(void)addText: (SKSpriteNode *)n; {
    SKLabelNode *moneyText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    moneyText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    moneyText.name = @"moneyText";
    moneyText.zPosition = 12;
    moneyText.fontSize = 140;
    moneyText.text = [money getBalanceAsString];
    moneyText.position = CGPointMake(0 - n.frame.size.width/3.8, -moneyText.frame.size.height/1.65);
    [n addChild:moneyText];
}
+(void)updateText: (SKScene *)s {
    SKSpriteNode *bar = (SKSpriteNode *)[s childNodeWithName:@"UIcoinBar"];
    SKLabelNode *mText = (SKLabelNode *)[bar childNodeWithName:@"moneyText"];
    mText.text = [money getBalanceAsString];
    SKSpriteNode *gembar = (SKSpriteNode *)[s childNodeWithName:@"UIgemBar"];
    SKLabelNode *gemText = (SKLabelNode *)[gembar childNodeWithName:@"gemText"];
    gemText.text = [gems getGemsAsString];
}
+(void)addGemBar:(SKScene *)s {
    SKSpriteNode *gemBar = [SKSpriteNode spriteNodeWithImageNamed:@"gemBar"];
    gemBar.anchorPoint = CGPointMake(0.5, 0.5);
    gemBar.position = CGPointMake(s.frame.size.width/2.75, s.frame.size.height/2.2);
    gemBar.xScale = 0.4;
    gemBar.yScale = 0.4;
    gemBar.zPosition = 11;
    gemBar.name = @"UIgemBar";
    [self addGemText:gemBar];
    [s addChild:gemBar];
}
+(void)addGemText: (SKSpriteNode *)n; {
    SKLabelNode *gemText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    gemText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    gemText.name = @"gemText";
    gemText.zPosition = 12;
    gemText.fontSize = 140;
    gemText.fontColor = [SKColor blackColor];
    gemText.text = [gems getGemsAsString];
    gemText.position = CGPointMake(0, -gemText.frame.size.height/1.65);
    [n addChild:gemText];
}
@end
