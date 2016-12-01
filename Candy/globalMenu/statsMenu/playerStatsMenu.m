//
//  playerStatsMenu.m
//  Candy
//
//  Created by Callum Beckwith on 30/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "playerStatsMenu.h"
#import "inventory.h"

@implementation playerStatsMenu
+(void)createPStatsMenu: (SKScene*)s {
    SKSpriteNode *splayerStatsBacking = [SKSpriteNode spriteNodeWithImageNamed:@"playerStatsTemplate"];
    SKSpriteNode *done = [self statsDoneButton:s];
    splayerStatsBacking.xScale = 0.43;
    splayerStatsBacking.yScale = 0.43;
    splayerStatsBacking.position = CGPointMake(s.frame.size.width, 0);
    splayerStatsBacking.name = @"statsPlayerMenu";
    splayerStatsBacking.anchorPoint = CGPointMake(0.5, 0.55);
    
    SKAction *slideRight = [SKAction moveByX:-s.frame.size.width y:0 duration:0.15];
    
    [self addStatsLabels:splayerStatsBacking];
    
    [s addChild:done];
    [s addChild:splayerStatsBacking];
    
    [splayerStatsBacking runAction:slideRight];
    [done runAction:slideRight];
}
+(SKSpriteNode*)statsDoneButton: (SKScene*)s {
    SKSpriteNode *buttonDone = [SKSpriteNode spriteNodeWithImageNamed:@"doneButton"];
    buttonDone.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDone.position = CGPointMake(0 + s.frame.size.width, -s.frame.size.height/2.25);
    buttonDone.xScale = 0.45;
    buttonDone.yScale = 0.45;
    buttonDone.zPosition = 11;
    buttonDone.name = @"statsDoneButton";
    return buttonDone;
}
+(void)onDoneTouch: (SKSpriteNode*)s scene:(SKScene*)sk{
    if([s.name isEqualToString:@"statsDoneButton"]){
        [self removeStatsMenu:sk];
    }
}
+(void)removeStatsMenu: (SKScene*)s {
    SKSpriteNode *menu = (SKSpriteNode*)[s childNodeWithName:@"statsPlayerMenu"];
    SKSpriteNode *button = (SKSpriteNode*)[s childNodeWithName:@"statsDoneButton"];
    
    SKAction *slideRight = [SKAction moveByX:s.frame.size.width y:0 duration:0.15];
    
    [menu runAction:slideRight completion:^{
        [menu removeFromParent];
    }];
    [button runAction:slideRight completion:^{
        [button removeFromParent];
    }];
}
+(void)addStatsLabels: (SKSpriteNode*)s {
    int slotOutputInt = ([inventory slotCalculation:1] + [inventory slotCalculation:2] + [inventory slotCalculation:3] + [inventory slotCalculation:4]);
    
    NSString *slotToString = [NSString stringWithFormat:@"%d", slotOutputInt];
    
    SKLabelNode *slotOutput = [SKLabelNode labelNodeWithText:slotToString];
    
    slotOutput.fontName = @"Coder's-Crux";
    slotOutput.fontSize = 150;
    slotOutput.fontColor = [SKColor blackColor];
    slotOutput.position = CGPointMake(0, -s.frame.size.height/6);
    
    
    [s addChild:slotOutput];
}
@end
