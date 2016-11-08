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

@implementation mainUI

//Literally all of this needs improving, each part of the ui will have its own class, makes it easier when it comes to making it look dynamic!
+(void)drawUI: (SKScene *)s{
    
    [inventoryButton addButton:s];
    [sweetsButton addButton:s];
    [coinButton addButton:s];
    [coinBarSprite addCoinBar:s];
    [comboBar addBar:s];
    
    SKSpriteNode *panelOne = [SKSpriteNode spriteNodeWithImageNamed:@"menuBarWhite"];
    panelOne.anchorPoint = CGPointMake(0.5, 0);
    panelOne.position = CGPointMake(0, -s.size.height/2);
    panelOne.yScale = 1.4;
    panelOne.xScale = 1;
    panelOne.zPosition = 10;
    
    [s addChild:panelOne];
    
    
    SKSpriteNode *buttonDunno = [SKSpriteNode spriteNodeWithImageNamed:@"dunnoButton"];
    buttonDunno.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDunno.position = CGPointMake(s.frame.size.width/2.5, s.frame.size.height/2.3);
    buttonDunno.xScale = 0.45;
    buttonDunno.yScale = 0.42;
    buttonDunno.zPosition = 11;
    [s addChild:buttonDunno];
    
    
}
@end
