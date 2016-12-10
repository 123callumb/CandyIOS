//
//  mainUI.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mainUI.h"
#import "inventoryButton.h"
#import "sweetsButton.h"
#import "coinButton.h"
#import "menuBacking.h"
#import "coinBarSprite.h"
#import "comboBar.h"
#import "packetButton.h"

@implementation mainUI

+(void)drawUI: (SKScene *)s{
    
    [inventoryButton addButton:s];
    [sweetsButton addButton:s];
    [coinButton addButton:s];
    [coinBarSprite addCoinBar:s];
    [comboBar addBar:s];
    [packetButton addButton:s];
    [self nonInteractiveUI:s];
}

+(void)nonInteractiveUI: (SKScene*)s {
    
    SKSpriteNode *panelOne = [SKSpriteNode spriteNodeWithImageNamed:@"menuBarWhite"];
    panelOne.anchorPoint = CGPointMake(0.5, 0);
    panelOne.position = CGPointMake(0, -s.size.height/2);
    panelOne.yScale = 1.4;
    panelOne.xScale = 1;
    panelOne.zPosition = 10;
    
    [s addChild:panelOne];
}
@end
