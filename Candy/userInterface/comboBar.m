//
//  comboBar.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "comboBar.h"
#import "combo.h"

@implementation comboBar
+(void)addBar: (SKScene*)s {
    SKSpriteNode *bar = [SKSpriteNode spriteNodeWithImageNamed:@"comboBar"];
    bar.xScale = 0.45;
    bar.yScale = 0.42;
    bar.name = @"comboBar";
    bar.zPosition = 10;
    bar.position = CGPointMake(s.frame.size.width/5.75, s.frame.size.height/2.3);
    [self addText:bar];
    [s addChild:bar];
}
+(void)addText: (SKSpriteNode *)n; {
    SKLabelNode *comboText = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
    comboText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    comboText.name = @"comboText";
    comboText.zPosition = 12;
    comboText.fontSize = 100;
    comboText.text = [combo getComboAsString];
    comboText.position = CGPointMake(0-comboText.frame.size.width/2 , 0-comboText.frame.size.height/3.3);
    [n addChild:comboText];
}
+(void)updateText: (SKScene *)s {
    SKSpriteNode *bar = (SKSpriteNode *)[s childNodeWithName:@"comboBar"];
    SKLabelNode *cText = (SKLabelNode *)[bar childNodeWithName:@"comboText"];
    cText.text = [combo getComboAsString];
}
@end
