//
//  bottomBar.m
//  Candy
//
//  Created by Callum Beckwith on 03/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "bottomBar.h"
#import "inventoryButton.h"
#import "coinButton.h"
#import "sweetsButton.h"
#import "menuButton.h"

@implementation bottomBar
+(void)addBottomBar: (SKScene*)s {
    SKSpriteNode *panelOne = [SKSpriteNode spriteNodeWithImageNamed:@"menuBarWhite"];
    panelOne.anchorPoint = CGPointMake(0.5, 0);
    panelOne.position = CGPointMake(0, (-s.size.height/2) * 2);
    panelOne.yScale = 1.4;
    panelOne.xScale = 1;
    panelOne.zPosition = 10;
    panelOne.name = @"bottomBar";
    
    [sweetsButton addButton:panelOne];
    [inventoryButton addButton:panelOne];
    [coinButton addButton:panelOne];
    
    [menuButton createCloseButton:s];
    [s addChild:panelOne];
    
    SKAction *slideUp = [SKAction moveToY:-s.frame.size.height/2 duration:0.3];
    [panelOne runAction:slideUp];
}
+(void)removeBar: (SKScene*)s {
    SKSpriteNode *bar = (SKSpriteNode*)[s childNodeWithName:@"bottomBar"];
    SKAction *slideUp = [SKAction moveToY:-s.frame.size.height duration:0.3];
    
    [bar runAction:slideUp completion:^{
        [bar removeFromParent];
    }];
}
@end
